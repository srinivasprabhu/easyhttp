require 'rubygems'
require 'logger'

module Easyhttp
  module Log
    $log = Logger.new(STDOUT)
    $log.level = Logger::INFO
  end
end