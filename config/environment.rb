require 'sinatra'

# we need to wrap the configuration settings in an app class
class MyApp < Sinatra::Base

  configure do
    # we need to specify where the views are
    set(:views, "app/views")
    
    # To open .html.erb files, need to register them
    Tilt.register(Tilt::ERBTemplate, 'html.erb')
    
    # alternative to setting the layout in every erb() call
    # we can set the default layout name to use and sinatra 
    # will look for that file
    set(:erb, :layout => :application_layout)
  end

  configure :development do
    require "sinatra/reloader"

    # we would also like a nicer error page in development
    require 'better_errors'
    require 'binding_of_caller'
    
    # need this configure for better errors
    use(BetterErrors::Middleware)
    BetterErrors.application_root = __dir__
    BetterErrors::Middleware.allow_ip!("0.0.0.0/0.0.0.0")
  end

end

require "./app/controllers/application_controller"
require "./app/models/recipe"
