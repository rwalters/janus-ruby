require 'spec_helper'
require 'janus/client'
require 'janus_client_initializer'

RSpec.configure do |config|
  config.include(
    Module.new do
      def stub_api_for(klass)
        klass.use_api (api = Her::API.new)

        # Here, you would customize this for your own API (URL, middleware, etc)
        # like you have done in your application’s initializer
        api.setup url: "http://server:3002/api" do |c|
          c.use Her::Middleware::FirstLevelParseJSON
          c.adapter(:test) { |s| yield(s) }
        end
      end
    end
  )
end
