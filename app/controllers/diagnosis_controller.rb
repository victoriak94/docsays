class DiagnosisController < ApplicationController

  def new
    @diagnosis = Diagosis.new
  end

  def create
    @diagnosis = Diagnosis.new
    @diagnosis.name = params[:diagnosis`][:name]

    if @diagnosis.save
      redirect_to patient_path(@patient)
      flash[:notice] = "Diagnosis Added."
    else
      render :new
      flash[:notice] = "Diagnosis Not Added."
    end


  end
  def show
    @diagnosis = Diagosis.find(params[:id])
  end






end
