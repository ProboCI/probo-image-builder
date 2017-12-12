/* SET THE HOST AND PORT OF WORDPRESS
 * *********************************************************/
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

# THE RECV FUNCTION
# ##########################################################
sub vcl_recv {

  # FORWARD THE IP OF THE REQUEST
  if (req.restarts == 0) {
    if (req.http.x-forwarded-for) {
      set req.http.X-Forwarded-For =
      req.http.X-Forwarded-For + ", " + client.ip;
    } else {
      set req.http.X-Forwarded-For = client.ip;
    }
  }

  # CLEAN UP THE ENCODING HEADER.  
  # SET TO GZIP, DEFLATE, OR REMOVE ENTIRELY.  WITH VARY ACCEPT-ENCODING
  # VARNISH WILL CREATE SEPARATE CACHES FOR EACH
  # DO NOT ACCEPT-ENCODING IMAGES, ZIPPED FILES, AUDIO, ETC.
  # ##########################################################
  if (req.http.Accept-Encoding) {
    if (req.url ~ "\.(jpg|png|gif|gz|tgz|bz2|tbz|mp3|ogg)$") {
      # No point in compressing these
      remove req.http.Accept-Encoding;
    } elsif (req.http.Accept-Encoding ~ "gzip") {
      set req.http.Accept-Encoding = "gzip";
    } elsif (req.http.Accept-Encoding ~ "deflate") {
      set req.http.Accept-Encoding = "deflate";
    } else {
      # unknown algorithm
      remove req.http.Accept-Encoding;
    }
  }

  # IF THIS IS A PURGE REQUEST, THEN CHECK THE IPS SET ABOVE
  # BLOCK IF NOT ONE OF THOSE IPS
  # ##########################################################
  if (req.request == "PURGE") {
    if ( !client.ip ~ purge ) {
      error 405 "Not allowed.";
    }
    return (lookup);
  }

  # PIPE ALL NON-STANDARD REQUESTS
  # ##########################################################
  if (req.request != "GET" &&
    req.request != "HEAD" &&
    req.request != "PUT" && 
    req.request != "POST" &&
    req.request != "TRACE" &&
    req.request != "OPTIONS" &&
    req.request != "DELETE") {
      return (pipe);
  }
   
  # ONLY CACHE GET AND HEAD REQUESTS
  # ##########################################################
  if (req.request != "GET" && req.request != "HEAD") {
    return (pass);
  }
  
  # OPTIONAL: DO NOT CACHE LOGGED IN USERS (THIS OCCURS IN FETCH TO, EITHER
  # COMMENT OR UNCOMMENT BOTH
  # ##########################################################
  if ( req.http.cookie ~ "wordpress_logged_in" ) {
    return( pass );
  }
  
  # IF THE REQUEST IS NOT FOR A PREVIEW, WP-ADMIN OR WP-LOGIN
  # THEN UNSET THE COOKIES
  # ##########################################################
  if (
    !(req.url ~ "wp-(login|admin)") 
    && !(req.url ~ "&preview=true" ) 
  ){
    unset req.http.cookie;
  }

  # IF BASIC AUTH IS ON THEN DO NOT CACHE
  # ##########################################################
  if (req.http.Authorization || req.http.Cookie) {
    return (pass);
  }
  
  # IF YOU GET HERE THEN THIS REQUEST SHOULD BE CACHED
  # ##########################################################
  return (lookup);
}

# HIT FUNCTION
# ##########################################################
sub vcl_hit {
  # IF THIS IS A PURGE REQUEST THEN DO THE PURGE
  # ##########################################################
  if (req.request == "PURGE") {
    purge;
    error 200 "Purged.";
  }
  return (deliver);
}

# MISS FUNCTION
# ##########################################################
sub vcl_miss {
  if (req.request == "PURGE") {
    purge;
    error 200 "Purged.";
  }
  return (fetch);
}

# FETCH FUNCTION
# ##########################################################
sub vcl_fetch {
  # I SET THE VARY TO ACCEPT-ENCODING, THIS OVERRIDES W3TC 
  # TENDANCY TO SET VARY USER-AGENT.  YOU MAY OR MAY NOT WANT
  # TO DO THIS
  # ##########################################################
  set beresp.http.Vary = "Accept-Encoding";

  # IF NOT WP-ADMIN THEN UNSET COOKIES AND SET THE AMOUNT OF 
  # TIME THIS PAGE WILL STAY CACHED (TTL)
  # ##########################################################
  if (!(req.url ~ "wp-(login|admin)") && !req.http.cookie ~ "wordpress_logged_in" ) {
    unset beresp.http.set-cookie;
    set beresp.ttl = 96h;
  }

  if (beresp.ttl <= 0s ||
    beresp.http.Set-Cookie ||
    beresp.http.Vary == "*") {
      set beresp.ttl = 120 s;
      return (hit_for_pass);
  }

  return (deliver);
}

# DELIVER FUNCTION
# ##########################################################
sub vcl_deliver {
  # IF THIS PAGE IS ALREADY CACHED THEN RETURN A 'HIT' TEXT 
  # IN THE HEADER (GREAT FOR DEBUGGING)
  # ##########################################################
  if (obj.hits > 0) {
    set resp.http.X-Cache = "HIT";
  # IF THIS IS A MISS RETURN THAT IN THE HEADER
  # ##########################################################
  } else {
    set resp.http.X-Cache = "MISS";
  }
}