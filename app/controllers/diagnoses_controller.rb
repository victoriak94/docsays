class DiagnosesController < ApplicationController
  before_action :ensure_logged_in
  before_action :load_doctor, only: [:new, :create]
  before_action :load_patient
  before_action :load_diagnosis, only: [:show, :destroy]

  def load_doctor
    @doctor = current_doctor
  end

  def load_patient
    @patient = Patient.find(params[:patient_id])
  end

  def load_diagnosis
    @diagnosis = Diagnosis.find(params[:id])
  end

  def index
    @diagnoses = @patient.diagnoses
    puts ".........................#{@diagnoses.inspect}"
  end

  def new
    @diagnoses = Diagnosis.new
  end

  def create
    @diagnosis = @patient.diagnoses.new(diagnosis_params)
    @diagnosis.name = params[:diagnosis][:name]
    @diagnosis.patient_id = params[:patient_id]
    @diagnosis.doctor_id = current_doctor.id

    if @diagnosis.save
      redirect_to patient_path(@patient)
      flash[:notice] = "Diagnosis added"
    else
      redirect_to new_patient_diagnosis_path
      flash[:notice] = "Diagnosis could not be added"
    end
  end

  def show

  end

  def destroy
    @diagnosis.destroy
    redirect_to patient_path(@patient)
    flash[:notice] = "Diagnosis deleted"
  end

  def diagnosis_params
    params.require(:diagnosis).permit
  end
end
