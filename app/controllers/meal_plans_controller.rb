class MealPlansController < ApplicationController
  before_action :ensure_logged_in
  before_action :load_meal_plan, only: [:show, :edit, :update, :destroy]

  def load_meal_plan
    @mealplan = MealPlan.find(params[:id])
  end

  def show
  end

  def new
    @mealplan = MealPlan.new
  end

  def create
    @mealplan = MealPlan.new
    @mealplan.name = params[:mealplans][:name]

    if @mealplan.save
      redirect_to patient_path(@patient)
      flash[:notice] = "Meal Plan Added!"
    else
      render :new
      flash[:notice] = "Meal Plan Not Added."
    end
  end
end

  def edit
  end

  def update
    @mealplan.name = params[:mealplans][:name]
    if @mealplan.save
      redirect_to patient_path(@patient)
      flash[:notice] = "Meal plan updated!"
    else
      render :new
      flash[:notice] = "Meal Plan not updated."
  end

  def destroy
    @mealplan.destroy
    redirect_to patient_path(@patient)
    flash[:notice] = "Meal plan deleted"
  end
end
