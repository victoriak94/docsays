class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    if params[:search]
      @myList = []
      (@myList << Recipe.where('name LIKE ? ', "%#{params[:search]}%")).flatten!
      (@myList << Recipe.where('health_label LIKE ? ', "%#{params[:search]}%")).flatten!
      (@myList << Recipe.where('ingredient_lines LIKE ? ', "%#{params[:search]}%")).flatten!
    else
      (@myList << Recipe.all).flatten!
    end
    p ".............................#{@myList.inspect}"
  end

  def show
    @recipe = Recipe.find(params[:id])
    # # @recipe.name = params[:recipe][:name]
    # # @recipe.image = params[:recipe][:image]
    # @recipe.url = params[:recipe][:url]
    # @recipe.health_label = params[:recipe][:health_label]
    # @recipe.ingredient_lines = params[:recipe][:ingredient_lines]
    # @recipe.calories = params[:recipe][:calories]
    # @recipe.total_nutrients = params[:recipe][:total_nutrients]
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to patient_path(@patient)
      flash[:notice] = "Recipe added!"
    else
      render :new
      flash[:notice] = "Recipe not added."
    end
  end

  def edit
  end

  def update
   @recipe.name = params[:recipe][:name]
   @recipe.image = params[:recipe][:image]
   @recipe.url = params[:recipe][:url]
   @recipe.health_label = params[:recipe][:health_label]
   @recipe.ingredient_lines = params[:recipe][:ingredient_lines]
   @recipe.calories = params[:recipe][:calories]
   @recipe.total_nutrients = params[:recipe][:total_nutrients]

   if @recipe.save
     redirect_to patient_path(@patient)
     flash[:notice] = "Recipe updated!"
   else
     render :new
     flash[:notice] = "Recipe not updated."
   end
 end

  def search
    @recipes = if params[:search]
      @myList = []
      @myList << Recipe.where('name LIKE ?', "#{params[:name]}")
      @myList << Recipe.where('health_label LIKE ? ', "#{params[:search]}")
      @myList << Recipe.where('ingredient_lines LIKE ? ', "#{params[:search]}")
      @myList << Recipe.where('calories LIKE ? ', "#{params[:search]}")
    else
      @myList <<  Recipe.all
    end
    puts ".............................#{myList}"
  end

  def recipe_params
    params.require(:recipes).permit(:name, :image, :url, :health_label, :ingredient_lines, :calories, :total_nutrients)
  end

end
