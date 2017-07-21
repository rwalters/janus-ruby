require 'time'
require 'grape'

module Janus
  module Server
    class API < Grape::API
      version 'v1', using: :header, vendor: 'janus'
      format :json
      prefix :api

      resource :statuses do
        desc 'Return an index.'
        get do
          5.times.map do |i|
            {id: i+1, sent_at: Time.parse("2017-02-13T22:1#{3+i}:53Z").iso8601}
          end
        end

        desc 'Return a random status.'
        get :random do
          max = 9_999_999
          min = (max*0.1).ceil
          mid = ((max+min)*0.5).ceil

          rndm = SecureRandom.random_number(min..max)
          delta = (rndm - mid)*10

          {
            id: rndm,
            sent_at: (Time.now.utc + delta).iso8601
          }
        end
      end
    end
  end
end
