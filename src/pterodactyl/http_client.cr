module Pterodactyl
  class HttpClient
    property host : String
    property token : String

    def initialize(@host : String, @token : String)
      @headers = HTTP::Headers{
        "Content-Type"  => "application/json",
        "Accept"        => "application/json",
        "Authorization" => "Bearer #{@token}",
      }
    end

    # Sets the host. Alias of `host=`.
    def set_host(host : String)
      @host = host
    end

    # Returns the base url for which this client will make API requests to.
    def base_url : URI
      if host.starts_with?("localhost")
        URI.parse("http://#{host}")
      else
        URI.parse("https://#{host}")
      end
    end

    # Performs a GET request on the path.
    def get(path : String)
      res = HTTP::Client.new(base_url).get(path, headers: @headers)
      return raise_error(res) if res.status_code >= 400
      res
    end

    # Performs a POST request on the path with a body.
    def post(path : String, body : String = "")
      res = HTTP::Client.new(base_url)
        .post(path, headers: @headers, body: body)

      raise_error(res) if res.status_code >= 400
    end

    def patch(path : String, body : String = "")
      res = HTTP::Client.new(base_url)
        .patch(path, headers: @headers, body: body)

      raise_error(res) if res.status_code >= 400
    end

    def put(path : String, body : String = "")
      res = HTTP::Client.new(base_url)
        .put(path, headers: @headers, body: body)

      raise_error(res) if res.status_code >= 400
    end

    def delete(path : String)
      res = HTTP::Client.new(base_url).delete(path, headers: @headers)
      raise_error(res) if res.status_code >= 400
    end

    private def raise_error(response : HTTP::Client::Response)
      error_list = Models::ErrorList(Models::Error).from_json response.body
      error_list.errors.each do |error|
        raise APIError.new(error)
      end
    end
  end
end
