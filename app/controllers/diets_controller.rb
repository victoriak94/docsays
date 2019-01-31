class DietsController < ApplicationController
  before_action :load_diagnosis
  before_action :load_diet, only: [:show, :edit, :update, :destroy]
  # before_action :load_diet_create_and_update_params, only: [:create, :update]

  def load_diagnosis
    @diagnosis = Diagnosis.find(params[:diagnosis_id])
  end

  def load_diet
    @diet = Diet.find(params[:id])
  end

  # def load_diet_create_and_update_params
  #
  # end

  def index
    @diets = @diagnosis.diets
  end

  def new
    @diets = Diet.new
  end

  def create
    @diet = @diagnosis.diets.new(diet_params)
    @diet.name = params[:diet][:name]
    @diet.avoid = params[:diet][:avoid]
    @diet.eat = params[:diet][:eat]
    @diet.diagnosis_id = params[:diagnosis_id]
    if @diet.save
      redirect_to patient_diagnoses_path(@patient)
      flash[:notice] = "Diet added!"
    else
      redirect_to new_patient_diagnosis_path
      flash[:notice] = "Diet could not be added"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @diet.save
      redirect_to patient_diagnoses_path(@patient)
      flash[:notice] = "Diet updated!"
    else
      redirect_to new_patient_diagnosis_path
      flash[:notice] = "Diet could not be updated"
    end
  end

  def destroy
    @diet.destroy
    redirect_to patient_path(@patient)
    flash[:notice] = "Diet deleted"
  end

  def diet_params
    params.require(:diet).permit(:name, :avoid, :eat)
  end

end
