class MealPlanController < ApplicationController

  def show
    @mealplan = MealPlan.find(params[:id])
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

  def edit
    @mealplan.name = params[:mealplans][:name]

  end

  def update

  end

  def destroy

  end

end
