require 'rack_es_logger/version'
require 'rack_es_logger/response'

module RackESLogger
  class Application
    attr_reader :payload

    def initialize(app)
      @app = app
    end

    def call(env)
      response = RackESLogger::Response.new(env)
      @payload = response.call
      @app.call(env)
    end
  end
end
