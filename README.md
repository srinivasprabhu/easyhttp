# Easyhttp

Easyhttp is tiny wrapper around http class of ruby.
Currently it supports get,post,put,delete and also supports both ssl and non-ssl based http requests.

## Installation

Add this line to your application's Gemfile:

    gem 'easyhttp'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easyhttp

## Usage

# Setting log level for the gem
Easyhttp.setLogLevel "DEBUG"   # If its not set by default INFO level is used within the api

# GET request
res = Easyhttp.get "http://api.flickr.com/services/rest/?method=flickr.test.echo&name=value"
p res.to_hash
{"age"=>["0"], "x-served-by"=>["www124.flickr.bf1.yahoo.com"], "cache-control"=>["private"], "connection"=>["close"], "vary"=>["Accept-Encoding"], "content-type"=>["text/xml; charset=utf-8"], "content-length"=>["132"], "date"=>["Fri, 25 Oct 2013 13:54:23 GMT"], "p3p"=>["policyref=\"http://info.yahoo.com/w3c/p3p.xml\", CP=\"CAO DSP COR CUR ADM DEV TAI PSA PSD IVAi IVDi CONi TELo OTPi OUR DELi SAMi OTRi UNRi PUBi IND PHY ONL UNI PUR FIN COM NAV INT DEM CNT STA POL HEA PRE LOC GOV\""], "server"=>["YTS/1.19.11"], "set-cookie"=>["xb=247841; expires=Mon, 26-Oct-2015 13:54:23 GMT; path=/; domain=.flickr.com"], "via"=>["HTTP/1.1 r15.ycpi.dee.yahoo.net UserFiberFramework/1.0"]}

p res.body
"<?xml version=\"1.0\" encoding=\"utf-8\" ?>\n<rsp stat=\"fail\">\n\t<err code=\"100\" msg=\"Invalid API Key (Key has invalid format)\" />\n</rsp>\n"

p res.msg
"OK"

p res.code
"200"

res = Easyhttp.get "https://check-restapi.com/login",{"content-type"=>"application/json","accept-type"=>"application/xml"}
res = Easyhttp.put "http://check-restapi.com/login/put",PUT_DATA,{"content-type"=>"application/json","accept-type"=>"application/xml"}  # Note: Now this is a non-ssl request
res = Easyhttp.post "http://check-restapi.com/login/post",POST_DATA,{"content-type"=>"application/json","accept-type"=>"application/xml"}
res = Easyhttp.delete "https://check-restapi.com/login/delete",{"content-type"=>"application/json","accept-type"=>"application/xml"}
res = Easyhttp.delete "https://check-restapi.com/login/delete"
res = Easyhttp.post "http://check-restapi.com/login/post",POST_DATA



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
