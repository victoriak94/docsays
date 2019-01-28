class MealPlansController < ApplicationController

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
