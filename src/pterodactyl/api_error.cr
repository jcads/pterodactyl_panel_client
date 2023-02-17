module Pterodactyl
  class APIError < Exception
    getter code : String
    getter status_code : Int32

    def initialize(error : Models::Error)
      @code = error.code
      @status_code = error.status.to_i32
      # initialize the message property of the base Exception class
      super(error.detail)
    end
  end
end
