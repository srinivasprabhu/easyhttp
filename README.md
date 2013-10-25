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

Setting log level for the gem

    Easyhttp.setLogLevel "DEBUG"   

If its not set by default INFO level is used within the api

# Example Code Snippet 

    url = "https://example.com/api"
    headers = {"content-type"=>"application/json","accept-type"=>"application/xml","date"=>"Fri, 25 Oct 2013 13:54:23 GMT"}
    data = {"userName"=>"srinivasprabhu","Password"=>"sdsdeffwedewd"}

    response = Easyhttp.get url,headers
    response = Easyhttp.post url,data,headers
    response = Easyhttp.delete url

    puts response.to_hash      # get headers from response
    puts response.body         # get http response body
    puts response.msg          # get http response message
    puts response.code         # get http return code
         

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
