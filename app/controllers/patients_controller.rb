class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def show
    @patients = Patient.all
    @patient = Patient.search(params[:search])
    @patient = Patient.find(params[:id])
    # @patient.name = params[:patient][:name]
    # @patient.diagnosis = Diagnosis.find(params[:id]) Need to define this in diagnosis controller create method
    # @patient.meal_plan = MealPlan.find(params[:patient_id])
    @mealplan = MealPlan.all
      if params[:search]
        @mealplan = MealPlan.search(params[:search]).order("created_at DESC")
      else
        @mealplan = MealPlan.all.order('created_at DESC')
      end

      response = HTTParty.get('https://api.edamam.com/search?q=health&app_id=1a5ac459&app_key=263e9d8bf34384b63230ee6f193da30b')
      @response = JSON.parse(response.body)
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new
    @patient.name = params[:patient][:name]
    @patient.sex = params[:patient][:sex]
    @patient.age = params[:patient][:age]

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
    # @patient.diagnosis = Diagnosis.find(params[:patient_id])
    # @patient.meal_plan = MealPlan.find(params[:patient_id])

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

  def patient_params
    params.require(:name).permit(:name, :age, :sex, :search)
  end
end
