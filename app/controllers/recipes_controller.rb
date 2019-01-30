class RecipesController < ApplicationController
  def index
    @recipes = Recipe.search(params[:search])
  end

  def show
    @recipe = Recipe.all
    if params[:search]
    @myList = Recipe.where('name LIKE ? OR ingredients LIKE ', "#{params[:search]}" "#{params[:search]}")
  else
   @myList =  Recipe.all
  end
   @myList =  Recipe.all
  p ".............................#{@myList.inspect}"
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new
    @recipe.name = params[:recipe][:name]
    @recipe.image = params[:recipe][:image]
    @recipe.uri = params[:recipe][:uri]
    @recipe.health_label = params[:recipe][:health_label]
    @recipe.ingredients = params[:recipe][:ingredients]
    @recipe.ingredient_lines = params[:recipe][:ingredient_lines]



    if @recipe.save
      redirect_to patient_path(@patient)
      flash[:notice] = "Meal Plan Added!"
    else
      render :new
      flash[:notice] = "Meal Plan Not Added."
    end
  end

  def search
    @recipes = if params[:search]
    @myList = Recipe.where('name LIKE ?', "#{params[:search]}")
  else
   @myList =  Recipe.all
  end
  puts ".............................#{myList}"
end

  def edit
  end

  def update
    @recipe.name = params[:recipe][:name]
    @recipe.image = params[:recipe][:image]
    @recipe.uri = params[:recipe][:uri]
    @recipe.health_label = params[:recipe][:health_label]
    @recipe.ingredients = params[:recipe][:ingredients]
    @recipe.ingredient_lines = params[:recipe][:ingredient_lines]
    if @recipe.save
      redirect_to patient_path(@patient)
      flash[:notice] = "Meal plan updated!"
    else
      render :new
      flash[:notice] = "Meal Plan not updated."
    end
  end

  def destroy
    @recipe.destroy
    redirect_to patient_path(@patient)
    flash[:notice] = "Meal plan deleted"
  end

end
