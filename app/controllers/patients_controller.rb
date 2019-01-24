class PatientsController < ApplicationController

  def index
  end

  def show
    @patient = Patient.find(params[:id])
    @patient.diagnosis = Diagnosis.find(params[:patient_id])
    @patient.meal_plan = MealPlan.find(params[:patient_id])
    @mealplan = MealPlan.all
      if params[:search]
        @mealplan = MealPlan.search(params[:search]).order("created_at DESC")
      else
        @mealplan = MealPlan.all.order('created_at DESC')
      end
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new
    @patient.name = params[:patient][:name]
    @patient.sex = params[:patient][:sex]
    @patient.age = params[:patient][:age]
    @patient.diagnosis = Diagnosis.find(params[:patient_id])
    @patient.meal_plan = MealPlan.find(params[:patient_id])

    if @patient.save
      redirect_to patient_path(@patient)
      flash[:notice] = "You have added your patient!"
    else
      render :new
      flash[:notice] = "We could not add your patient"
    end
  end

  def edit
  end

  def update
    @patient.name = params[:patient][:name]
    @patient.sex = params[:patient][:sex]
    @patient.age = params[:patient][:age]
    @patient.diagnosis = Diagnosis.find(params[:patient_id])
    @patient.meal_plan = MealPlan.find(params[:patient_id])

    if @patient.save
      redirect_to patient_path(@patient)
      flash[:notice] = "You have added your patient!"
    else
      render :new
      flash[:notice] = "We could not add your patient"
    end
  end

  def destroy
    @patient.destroy
    redirect_to "/patients"
    flash[:notice] = "Patient deleted"
  end

end
