require 'rubygems'
require 'net/http'
require 'net/https'
require 'uri'

module Easyhttp
  module Web
    private
    def http_methods(method,url,headers,payload=nil)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host,uri.port)
      if url =~ /^https\:\/\//
        $log.info "Enabling ssl"
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      case method
        when "GET"
          if(uri.query)
            urlpath = uri.path+"?"+uri.query
          else
            urlpath = uri.path
          end
            response = http.get(urlpath,headers)
          return response
        when "POST"
          response = http.post(uri.path,payload,headers)
          return response
        when "PUT"
          response = http.put(uri.path,payload,headers)
          return response
        when "DELETE"
          response = http.delete(uri.path,headers)
          return response
      end
    end

    private
    def catch_redirections http_response
       if http_response.class.name == "Net::HTTPRedirection"
        location = http_response.to_hash['location']
        $log.info "redirected to #{location}"
       end
      return
    end
  end
end