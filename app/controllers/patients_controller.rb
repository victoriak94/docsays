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
    @recipes = Recipe.all
    @recipes = Recipe.search(params[:search])
    if params[:search]
      @recipes = Recipe.where(nil)
      @recipes = @recipes.name(params[:name]) if params[:name].present?
      @recipes = @recipes.url(params[:url]) if params[:url].present?
      @recipes = @recipes.health_label(params[:health_label]) if params[:health_label].present?
      @recipes = @recipes.ingredient_lines(params[:ingredient_lines]) if params[:ingredient_lines].present?
      @recipes = @recipes.calories(params[:calories]) if params[:calories].present?
    else
      @recipes =  Recipe.all
    end
    # @recipes = Recipe.all #idk if this works
    #   if params[:search]
    #     @recipe = Recipe.search(params[:search]).order("created_at DESC")
    #   else
    #     @recipe = Recipe.all.order('created_at DESC')
    #   end
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
    @diets = Diet.search_by_term(params[:query])
    render json: @diets
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
