class PatientsController < ApplicationController
  before_action :ensure_logged_in
  before_action :load_patients, only: [:index, :show]
  before_action :load_patient, only: [:show, :destroy]
  before_action :load_new_patient, only: [:new, :create]
  before_action :load_patient_update_and_create_params, only: [:create, :update]
  before_action :configure_permitted_parameters, if: :devise_controller?

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, key: [:name])
   devise_parameter_sanitizer.permit(:account_update, key: [:name, :avatar])
end

  def load_patients
    @patients = Patient.all
  end

  def load_new_patient
    @patient = Patient.new
  end

  def load_patient
    @patient = Patient.find(params[:id])
  end

  def load_patient_update_and_create_params
    @patient.email = params[:patient][:email]
    @patient.name = params[:patient][:name]
    @patient.sex = params[:patient][:sex]
    @patient.age = params[:patient][:age]
  end

  def index

  end

  def show
  end

  def new
  end

  def create
    if @patient.save
      redirect_to patient_path(@patient)
      flash[:notice] = "Patient added!"
    else
      render :new
      flash[:notice] = "Could not add your patient"
    end
  end

  def edit
  end

  def search
    @diets = Diet.search_by_term(params[:query])

    render json: @diets
  end

  def update
    # @patient.mealplan = MealPlan.find(params[:patient_id])
    if @patient.save
      redirect_to patient_path(@patient)
      flash[:notice] = "Patient has been updated!"
    else
      render :new
      flash[:notice] = "Could not update patient"
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
