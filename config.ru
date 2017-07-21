$:.unshift File.expand_path('lib', File.dirname(__FILE__))
require 'janus/api'

run Janus::API
