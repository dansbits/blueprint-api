require_relative "./config/bootstrap"
require_relative "./app/routers/v1/screener_router"
require "sinatra/reloader"

Dir["app/models/**/*.rb"].each { |file| require_relative file }

class BlueprintApi < Sinatra::Base

  configure {
    set :server, :puma
  }

  helpers do
    def json_params
      JSON.parse(request.body.read)
    end
  end

  register Routers::V1::ScreenerRouter
end