require 'rubygems'
require File.dirname(__FILE__)+'/easyhttp/version'
require File.dirname(__FILE__)+'/easyhttp/headers'
require File.dirname(__FILE__)+'/easyhttp/log'
require File.dirname(__FILE__)+'/easyhttp/web'



module Easyhttp
  class << self
    include Log
    include Headers
    include Web

    def Easyhttp.get url,headers=$default_headers
     $log.info "GET - #{url}"
     $log.debug "Headers - #{headers.inspect}"
     begin
        res = http_methods("GET",url,headers)
        catch_redirections(res)
      return res
    rescue => e
      raise "#{e.message}\n#{e.backtrace.join("\n\t")}"
    end
  end

  def Easyhttp.put url,payload,headers=$default_headers
    $log.info "PUT - #{url}"
    $log.debug "Headers - #{headers.inspect}"
    begin
      res = http_methods("PUT",url,headers,payload)
      return res
    rescue => e
      raise "#{e.message}\n#{e.backtrace.join("\n\t")}"
    end
  end

  def Easyhttp.post url,payload,headers=$default_headers
    $log.info "POST - #{url}"
    $log.debug "Headers - #{headers.inspect}"
    begin
      res = http_methods("POST",url,headers,payload)
      return res
    rescue => e
      raise "#{e.message}\n#{e.backtrace.join("\n\t")}"
    end
  end

  def Easyhttp.delete url,headers=$default_headers
    $log.info "DELETE - #{url}"
    $log.debug "Headers - #{headers.inspect}"
    begin
      res = http_methods("DELETE",url,headers)
      return res
    rescue  => e
      raise "#{e.message}\n#{e.backtrace.join("\n\t")}"
    end
  end

  def Easyhttp.setLogLevel level
    if level == "INFO"
      $log.level = Logger::INFO
    elsif level == "DEBUG"
      $log.level = Logger::DEBUG
    elsif level == "WARN"
      $log.level = Logger::WARN
    end
  end
end

end
