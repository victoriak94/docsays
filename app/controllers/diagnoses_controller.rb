class DiagnosesController < ApplicationController
  before_action :ensure_logged_in
  before_action :load_doctor
  before_action :load_patient
  before_action :load_diagnosis, only: [:show, :destroy]

  def load_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def load_patient
    @patient = Patient.find(params[:patient_id])
  end

  def load_diagnosis
    @diagnosis = Diagnosis.find(params[:id])
  end

  def index
    @diagnoses = @patient.diagnoses # idk if this works
  end

  def new
    @diagnosis = Diagnosis.new
  end

  def create
    @diagnosis = @patient.diagnosis.new(diagnosis_params) # idk if this works
    @diagnosis.name = params[:diagnosis][:name]
    @diagnosis.patient_id = params[:diagnosis][:patient_id] # idk if this works
    @diagnosis.doctor_id = current_doctor.id

    if @diagnosis.save
      redirect_to patient_path(@patient)
      flash[:notice] = "Diagnosis added"
    else
      render :new
      flash[:notice] = "Diagnosis not added"
    end
  end

  def show
  end

  def destroy
    @diagnosis.destroy
    redirect_to patient_path(@patient)
    flash[:notice] = "Diagnosis deleted"
  end
end
