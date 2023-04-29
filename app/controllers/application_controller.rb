class ApplicationController < Sinatra::Base
  # we not longer need to require sinatra
  # require 'sinatra'

  configure do
    # we need to specify where the views are
    views_directory = File.join(__dir__, '..', 'views')
    set(:views, views_directory)
    
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

  get('/') do
    "
    <h1>Welcome to your Sinatra App!</h1>
    <p>Define some routes in app.rb</p>
    "
  end

  get('/square/new') do
    puts params
    erb(:"calculation_templates/square_form")
  end

  get('/square/results') do
    # puts params
    # params = {"elephant"=>"42"}
    
    @num = params.fetch("elephant").to_f
    @square_of_num = @num * @num

    erb(:"calculation_templates/square_results")
  end

  get('/random/results') do
    # puts params
    # params = {"user_min"=>"1.5", "user_max"=>"4.5"}

    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    
    erb(:"calculation_templates/random_results")
  end

  get('/dice/:number/:sides') do
    # puts params
    # params = {"number"=>"4", "sides"=>"5"}

    @number_of_dice = params.fetch("number")
    @sides_per_dice = params.fetch("sides")

    erb(:dice_roll)
  end

end
