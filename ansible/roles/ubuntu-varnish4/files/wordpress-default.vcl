vcl 4.0; 
import std;
 
# Default backend definition. Set this to point to your content server.
backend default {
    .host = "127.0.0.1";
    .port = "8080";
    .connect_timeout = 600s;
    .first_byte_timeout = 600s;
    .between_bytes_timeout = 600s;
}
 
 
acl purge {
        "localhost";
}
 
sub vcl_recv {
 
        ###
        ### Allow purging
        ###
        if (req.method == "PURGE") {
                if (!client.ip ~ purge) {
                    return (synth(405, "This IP is not allowed to send PURGE requests."));
                }
                return (purge);
        }

 
        ###
        ### Do not Cache: special cases
        ###
 
        ### Do not Authorized requests.
        if (req.http.Authorization) {
                return(pass);
        }
 
        ### Pass any requests with the "If-None-Match" header directly.
        if (req.http.If-None-Match) {
                return(pass);
        }
 
        ### Do not cache AJAX requests.
        if (req.http.X-Requested-With == "XMLHttpRequest") {
                return(pass);
        }
 
        ### Only cache GET or HEAD requests. This makes sure the POST (and OPTIONS) requests are always passed.
        if (req.method != "GET" && req.method != "HEAD") {
                return (pass);
        }
 
        ### Static files: Do not cache PDF, XML, ... files (=static & huge and no use caching them - in all Vary: variations!)
        if (req.url ~ "\.(doc|mp3|pdf|tif|tiff|xml)(\?.*|)$") {
                return(pass);
        }
 
        # WordPress: disable caching for some parts of the backend (mostly admin stuff)
        # and WP search results.
        if (req.url ~ "^/wp-(login|admin)" ||
            req.url ~ "/wp-cron.php" ||
            req.url ~ "/wp-content/uploads/" ||
            req.url ~ "preview=true" ||
            req.url ~ "xmlrpc.php"   ||
            req.url ~ "\?s=" ||
            req.url ~ "/wta-member-contact-us" ||
            req.url ~ "/directory" ||
            req.url ~ "/become-a-member"
        ) {
                return(pass);
        }
 
        # WooCommerce
        if (req.url ~ "\?add-to-cart=") {
                return(pass);
        }
 
        # Kick DFind requests
        if (req.url ~ "^/w00tw00t") {
                return (synth(404, "Not Found"));
        }
 
 
        ### 
        ### http header Cookie
        ###     Remove some cookies (if found).
        ###
        # https://www.varnish-cache.org/docs/4.0/users-guide/increasing-your-hitrate.html#cookies
 
        # Unset the header for static files
        if (req.url ~ "\.(css|flv|gif|htm|html|ico|jpeg|jpg|js|mp3|mp4|pdf|png|swf|tif|tiff|xml)(\?.*|)$") {
                unset req.http.Cookie;
        }
 
        if (req.http.cookie) {
                # Google Analytics
                set req.http.Cookie = regsuball( req.http.Cookie, "(^|;\s*)(__utm[a-z]+)=([^;]*)", "");
                set req.http.Cookie = regsuball( req.http.Cookie, "(^|;\s*)(_ga)=([^;]*)", "");
 
                # Quant Capital
                set req.http.Cookie = regsuball( req.http.Cookie, "(^|;\s*)(__qc[a-z]+)=([^;]*)", "");
 
                # __gad __gads
                set req.http.Cookie = regsuball( req.http.Cookie, "(^|;\s*)(__gad[a-z]+)=([^;]*)", "");
 
                # Google Cookie consent (client javascript cookie)
                set req.http.Cookie = regsuball( req.http.Cookie, "(^|;\s*)(displayCookieConsent)=([^;]*)", "");
 
                # Other known Cookies: remove them (if found).
                set req.http.Cookie = regsuball( req.http.Cookie, "(^|;\s*)(__CT_Data)=([^;]*)", "");
                set req.http.Cookie = regsuball( req.http.Cookie, "(^|;\s*)(WRIgnore|WRUID)=([^;]*)", "");
 
 
                # Remove has_js and CloudFlare/Google Analytics __* cookies.
                set req.http.Cookie = regsuball(req.http.Cookie, "(^|;\s*)(_[_a-z]+|has_js)=[^;]*", "");
                # Remove a ";" prefix, if present.
                set req.http.Cookie = regsub(req.http.Cookie, "^;\s*", "");
 
 
                # PostAction: Remove (once and if found) a ";" prefix followed by 0..n whitespaces.
                # INFO \s* = 0..n whitespace characters
                set req.http.Cookie = regsub( req.http.Cookie, "^;\s*", "" );
 
                # PostAction: Unset the header if it is empty or 0..n whitespaces.
                if ( req.http.cookie ~ "^\s*$" ) {
                        unset req.http.Cookie;
                }
 
                # Check the cookies for wordpress-specific items
                if (req.http.Cookie ~ "wordpress_" || req.http.Cookie ~ "comment_") {
                        return (pass);
                }
        }
  
        return(hash);
}
 
sub vcl_backend_response {
 
        set beresp.ttl = 5m;
        set beresp.grace = 8h;
        set beresp.http.cache-control = "max-age = 259200";
 
        # Happens after we have read the response headers from the backend.
        # Here you clean the response headers, removing silly Set-Cookie headers
        # and other mistakes your backend does.
 
        # main variable = beresp.
 
}
 
sub vcl_deliver {
        # Remove ban-lurker friendly custom headers when delivering to client.
        unset resp.http.X-Url;
        unset resp.http.X-Host;
 
        if (obj.hits > 0) {
                set resp.http.X-Cache = "HIT";
        } else {
                set resp.http.X-Cache = "MISS";
        }
 
}
 
sub vcl_pipe {
        # https://www.varnish-software.com/blog/using-pipe-varnish
        # Note that only the first request to the backend will have X-Forwarded-For set.
        # If you use X-Forwarded-For and want to have it set for all requests, 
        # then make sure to use this: set req.http.connection = "close";
        # (This code is not necessary if you do not do any request rewriting.)
 
        set req.http.connection = "close";
}