# Dependencies
require './boot'
require 'ostruct'

# Modules
require "janus/client/config"

module Janus
  module Client
    def self.api
      @api
    end

    def self.configure(&blk)
      options = OpenStruct.new
      yield(options)

      @api = Her::API.new
      @api.setup :url => options[:url] do |c|
        # Request middleware
        c.use Faraday::Request::UrlEncoded


        # Response middleware
        c.use Her::Middleware::DefaultParseJSON

        # Adapter
        c.use Faraday::Adapter::NetHttp
      end

      require "janus/client/status"
    end
  end
end
