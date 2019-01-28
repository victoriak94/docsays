class PatientsController < ApplicationController
  before_action :ensure_logged_in
  before_action :load_patients, only: [:index, :show]
  before_action :load_patient, only: [:show, :destroy]
  before_action :load_patient_update_and_create_params, only: [:create, :update]

  def load_patients
    @patients = Patient.all
  end

  def load_patient
    @patient = Patient.find(params[:id])
<<<<<<< HEAD
    # @patient.name = params[:patient][:name]
    # @patient.diagnosis = Diagnosis.find(params[:id]) Need to define this in diagnosis controller create method
    # @patient.meal_plan = MealPlan.find(params[:patient_id])
=======
  end

  def load_patient_update_and_create_params
    @patient.image = params[:patient][:image]
    @patient.email = params[:patient][:email]
    @patient.name = params[:patient][:name]
    @patient.sex = params[:patient][:sex]
    @patient.age = params[:patient][:age]
  end

  def index
    @patients = Patient.all
  end

  def show
    #@patient = Patient.search(params[:search])
    @mealplans = MealPlan.all #idk if this works
      if params[:search]
        @mealplan = MealPlan.search(params[:search]).order("created_at DESC")
      else
        @mealplan = MealPlan.all.order('created_at DESC')
      end
>>>>>>> e9927993562bb95ded0c18c71b19a151caec42e3
  end

  def new
    @patient = Patient.new
  end

  def create
    Rails.logger.info("..............................#{patient_params}")
    @patient = Patient.create(patient_params)
    @patient.invite!(current_doctor)

    
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

  def search
    @diets = Diet.search_by_term(params[:query])
    render json: @diets
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
    params.require(:name).permit(:name, :age, :sex, :search, :image)
  end
end
