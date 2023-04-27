# first we import sinatra so we have access to its 
# objects and methods
require 'sinatra'

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
