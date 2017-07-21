require 'time'
require 'grape'

module Janus
  class API < Grape::API
    version 'v1', using: :header, vendor: 'janus'
    format :json
    prefix :api

    resource :statuses do
      desc 'Return a public timeline.'
      get :public_timeline do
        5.times.map do |i|
          {id: i+1, sent_at: Time.parse("2017-02-13T22:1#{3+i}:53Z").iso8601}
        end
      end
    end
  end
end
