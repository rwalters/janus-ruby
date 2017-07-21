module Janus::Client
  class Status
    include Her::Model
    use_api Janus::Client.api
  end
end
