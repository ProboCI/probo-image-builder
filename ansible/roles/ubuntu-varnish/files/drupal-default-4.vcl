vcl 4.0;
import std;
import directors;

# This is a basic VCL configuration file for varnish.  See the vcl(7)
# man page for details on VCL syntax and semantics.
#
# Default backend definition.  Set this to point to your content
# server.
#
backend default {
    .host = "127.0.0.1";
    .port = "8080";
    .connect_timeout = 600s;
    .first_byte_timeout = 600s;
    .between_bytes_timeout = 600s;
}

# Access control list for PURGE requests.
# Here you need to put the IP address of your web server
acl purge {
  "localhost";
}

# Respond to incoming requests.
sub vcl_recv {

  # Only allow PURGE requests from IP addresses in the 'purge' ACL.
  if (req.method == "PURGE") {
    if (!client.ip ~ purge) {
      return (synth(405, "Not allowed."));
    }
    return (hash);
  }

  # Only allow BAN requests from IP addresses in the 'purge' ACL.
  if (req.method == "BAN") {
    # Same ACL check as above:
    if (!client.ip ~ purge) {
      return (synth(403, "Not allowed."));
    }

    # Logic for the ban, using the Cache-Tags header. For more info
    # see https://github.com/geerlingguy/drupal-vm/issues/397.
    if (req.http.Cache-Tags) {
      ban("obj.http.Cache-Tags ~ " + req.http.Cache-Tags);
    }
    else {
      return (synth(403, "Cache-Tags header missing."));
    }

    # Throw a synthetic page so the request won't go to the backend.
    return (synth(200, "Ban added."));
  }

  # Only cache GET and HEAD requests (pass through POST requests).
  if (req.method != "GET" && req.method != "HEAD") {
    return (pass);
  }

  # Do not cache these paths.
  if (req.url ~ "^/status\.php$" ||
      req.url ~ "^/update\.php$" ||
      req.url ~ "^/install\.php" ||
      req.url ~ "^/ooyala/ping$" ||
      req.url ~ "^/admin/build/features" ||
      req.url ~ "^/info/.*$" ||
      req.url ~ "^/flag/.*$" ||
      req.url ~ "^/system/files/.*$" ||
      req.url ~ "^.*/ajax/.*$" ||
      req.url ~ "^.*/ahah/.*$") {
       return (pass);
  }

  # Do not allow outside access to cron.php or install.php.
  if (req.url ~ "^/(cron|install)\.php$") {
    return (synth(404, "Page not found."));
    # Use a custom error page that you've defined in Drupal at the path "404".
    # set req.url = "/";
  }

  # Handle compression correctly. Different browsers send different
  # "Accept-Encoding" headers, even though they mostly all support the same
  # compression mechanisms. By consolidating these compression headers into
  # a consistent format, we can reduce the size of the cache and get more hits.=
  # @see: http:// varnish.projects.linpro.no/wiki/FAQ/Compression
  if (req.http.Accept-Encoding) {
    if (req.http.Accept-Encoding ~ "gzip") {
      # If the browser supports it, we'll use gzip.
      set req.http.Accept-Encoding = "gzip";
    }
    else if (req.http.Accept-Encoding ~ "deflate") {
      # Next, try deflate if it is supported.
      set req.http.Accept-Encoding = "deflate";
    }
    else {
      # Unknown algorithm. Remove it and send unencoded.
      unset req.http.Accept-Encoding;
    }
  }

  # Never cache the following file types for all users.
  # We've had issues with image styles in Drupal 8.
  if (req.url ~ "(?i)\.(png|gif|jpeg|jpg|ico)(\?itok=.*)$") {
    return (pass);
  }

  # Always cache the following file types for all users.
  if (req.url ~ "(?i)\.(pdf|asc|dat|txt|doc|xls|ppt|tgz|csv|png|gif|jpeg|jpg|ico|svg|swf|css|js|html|htm)(\?.*)?$") {
    unset req.http.Cookie;
  }

  # Remove all cookies that Drupal doesn't need to know about. ANY remaining
  # cookie will cause the request to pass-through to Apache. For the most part
  # we always set the NO_CACHE cookie after any POST request, disabling the
  # Varnish cache temporarily. The session cookie allows all authenticated users
  # to pass through as long as they're logged in.
  if (req.http.Cookie) {
    set req.http.Cookie = ";" + req.http.Cookie;
    set req.http.Cookie = regsuball(req.http.Cookie, "; +", ";");
    set req.http.Cookie = regsuball(req.http.Cookie, ";(SESS[a-z0-9]+|NO_CACHE)=", "; \1=");
    set req.http.Cookie = regsuball(req.http.Cookie, ";(SSESS[a-z0-9]+|NO_CACHE)=", "; \1=");
    set req.http.Cookie = regsuball(req.http.Cookie, ";[^ ][^;]*", "");
    set req.http.Cookie = regsuball(req.http.Cookie, "^[; ]+|[; ]+$", "");

    if (req.http.Cookie == "") {
      # If there are no remaining cookies, remove the cookie header. If there
      # aren't any cookie headers, Varnish's default behavior will be to cache
      # the page.
      unset req.http.Cookie;
    }
    else {
      # If there is any cookies left (a session or NO_CACHE cookie), do not
      # cache the page. Pass it on to Apache directly.
      return (pass);
    }
  }
}

# Routine used to determine the cache key if storing/retrieving a cached page.
sub vcl_hash {
  # Include cookie in cache hash.
  # This check is unnecessary because we already pass on all cookies.
  # if (req.http.Cookie) {
  #   set req.hash += req.http.Cookie;
  # }
  # This is used to ensure that we do not cache http and https as the same thing.
  if (req.http.X-Forwarded-Proto) {
    hash_data(req.http.X-Forwarded-Proto);
  }
}

# Code determining what to do when serving items from the Apache servers.
sub vcl_backend_response {
  # Set ban-lurker friendly custom headers.
  set beresp.http.X-Url = bereq.url;
  set beresp.http.X-Host = bereq.http.host;

  # Cache 404s, 301s, at 500s with a short lifetime to protect the backend.
  if (beresp.status == 404 || beresp.status == 301 || beresp.status == 500) {
    set beresp.ttl = 10m;
  }

  # Don't allow static files to set cookies.
  if (bereq.url ~ "(?i)\.(pdf|asc|dat|txt|doc|xls|ppt|tgz|csv|png|gif|jpeg|jpg|ico|swf|css|js|htm|html)(\?.*)?$") {
    # beresp == Back-end response from the web server.
    unset beresp.http.set-cookie;
  }

  # Allow items to be stale if needed.
  set beresp.grace = 6h;
}

# Set a header to track a cache HITs and MISSes.
sub vcl_deliver {
  # Remove ban-lurker friendly custom headers when delivering to client.
  unset resp.http.X-Url;
  unset resp.http.X-Host;
  # Comment these for easier Drupal cache tag debugging in development.
  unset resp.http.Cache-Tags;
  unset resp.http.X-Drupal-Cache-Contexts;

  if (obj.hits > 0) {
    set resp.http.Cache-Tags = "HIT";
  }
  else {
    set resp.http.Cache-Tags = "MISS";
  }
}

# In the event of an error, show friendlier messages.
sub vcl_backend_error {
  set resp.http.Content-Type = "text/plain; charset=utf-8";
  synthetic("Page Unavailable");
  return (deliver);
}
