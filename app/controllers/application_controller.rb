class ApplicationController < MyApp
  
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

  get('/recipes') do
    @recipes = Recipe.all
    erb(:recipe_index)
  end

  get('/recipes/new') do
    erb(:recipe_new)
  end

  get('/add_new_recipe') do
    # get data from params
    title = params.fetch("title")
    description = params.fetch("description")
    ingredients = params.fetch("ingredients")

    @recipe = Recipe.new(title, description, ingredients)
    @recipe.save

    redirect("/recipes/#{@recipe.id}")
  end

  get('/recipes/:recipe_id') do
    @recipe = Recipe.find(params.fetch("recipe_id").to_i)
    erb(:recipe_details)
  end

end
