# This file is used by Rack-based servers to start the application.

use Rack::Cors do
  allow do
    origins 'http://localhost:5173',
            'http://127.0.0.1:5173',
            /\Ahttp:\/\/192\.168\.0\.\d{1,3}(:\d+)?\z/

    resource '/file/list_all/', headers: 'x-domain-token'

    resource '/file/at/*',
      methods: [ :get, :post, :delete, :put, :patch, :options, :head ],
      headers: :any,
      expose: [ 'Some-Custom-Response-Header' ],
      max_age: 600
  end

  allow do
    origins 'http://localhost:5173', 'http://127.0.0.1:5173'

    resource '/public/*',
      headers: :any,
      methods: :get

    resource '/api/v1/*',
      headers: :any,
      methods: [ :get, :post, :delete, :put, :patch, :options, :head ]
  end
end

require_relative "config/environment"

run Rails.application
Rails.application.load_server
