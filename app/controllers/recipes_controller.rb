class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @recipes = Recipe.search(params[:search])
    if params[:search]
      @recipes = Recipe.where(nil)
      @recipes = @recipes.name(params[:name]) if params[:name].present?
      @recipes = @recipes.url(params[:url]) if params[:url].present?
      @recipes = @recipes.health_label(params[:health_label]) if params[:health_label].present?
      @recipes = @recipes.ingredient_lines(params[:ingredient_lines]) if params[:ingredient_lines].present?
      @recipes = @recipes.calories(params[:calories]) if params[:calories].present?
    else
      @recipes =  Recipe.all
    end
  end

  def show
    if params[:search]
      @myList = Recipe.where('name LIKE ? OR ingredients LIKE ', "#{params[:search]}" "#{params[:search]}")
    else
      @myList =  Recipe.all
    end
    p ".............................#{@myList.inspect}"
  end

  def new
    @recipes = Recipe.new
  end

  def create
    @recipe = Recipe.new
    @recipe.name = params[:recipe][:name]
    @recipe.image = params[:recipe][:image]
    @recipe.url = params[:recipe][:url]
    @recipe.health_label = params[:recipe][:health_label]
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
