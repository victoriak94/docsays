class MealPlansController < ApplicationController
  def index
    @recipes = Recipe.search(params[:search])
  end

  def show
    @recipe = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new
    @recipe.name = params[:meal_plan][:name]
    @recipe.image = params[:meal_plan][:image]
    @recipe.uri = params[:meal_plan][:uri]
    @recipe.health_label = params[:meal_plan][:health_label]
    @recipe.ingredients = params[:meal_plan][:ingredients]
    @recipe.ingredient_lines = params[:meal_plan][:ingredient_lines]



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
    Recipe.where('name LIKE ?', "#{params[:search]}")
  else
    Recipe.all
  end
end

  def edit
  end

  def update
    @recipe.name = params[:meal_plans][:name]
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
