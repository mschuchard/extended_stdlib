# frozen_string_literal: true

require 'net/http'

# Sends a GET request and returns the HTTP response body as a hash.
Puppet::Functions.create_function(:"extended_stdlib::http_get") do
  # @param hostname The hostname for the endpoint.
  # @param path The path after the hostname for the endpoint.
  # @param port The HTTP port for the endpoint (default: 80).
  # @return String The HTTP response body from the GET request.
  # @example Returns a response body from a GET reqest.
  #   http_get('jsonplaceholder.typicode.com', '/todos/1') =>
  #   {
  #     "userId": 1,
  #     "id": 1,
  #     "title": "delectus aut autem",
  #     "completed": false
  #   }
  dispatch :http_get do
    param 'String', :hostname
    param 'String', :path
    optional_param 'Integer', :port
    return_type 'String'
  end

  def http_get(hostname, path, port = 80)
    Net::HTTP.get(hostname, path, port)
  end
end
