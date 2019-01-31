class PatientsController < ApplicationController
  before_action :ensure_logged_in
  before_action :load_patients, only: [:index, :show]
  before_action :load_patient, only: [:show, :destroy]
  before_action :load_patient_update_and_create_params, only: [:create, :update]

  def load_patients
    @patients = Patient.all
  end

  def load_patient
      @patients = Patient.search(params[:search])
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
    @patient = Patient.find((params)[:id])
    @recipes = Recipe.all #idk if this works
      if params[:search]
        @recipe = Recipe.search(params[:search]).order("created_at DESC")
      else
        @recipe = Recipe.all.order('created_at DESC')
      end
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

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
    @patients = []
    puts " .........................#{Patient.find_by_name(params[:patient][:name]).inspect}"
    @patients <<  Patient.find_by_name(params[:patient][:name])

    respond_to do |format|

          format.html do
            puts ".............response format as html #{@patients.length}"
            render partial: 'doctors/patientList', locals:{patients: @patients}
          end
    end
  end

  def update
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

  def destroy
    @patient.destroy
    redirect_to "/patients"
    flash[:notice] = "Patient deleted"
  end

  def patient_params
    params.require(:name).permit(:name, :age, :sex, :search, :image)
  end
end
