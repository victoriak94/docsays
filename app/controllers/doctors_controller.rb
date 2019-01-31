class DoctorsController < ApplicationController
    before_action :authenticate_doctor!
    before_action :load_doctor, only: [:create, :show, :destroy]
    before_action :load_new_doctor, only: [:new, :create]
    before_action :load_doctor_create_and_update_params, only: [:create, :update]

    def load_doctor
      @doctor = Doctor.find(params[:id])
    end

    def load_new_doctor
      @doctor = Doctor.new
    end

    def load_doctor_create_and_update_params
      @doctor.image = params[:doctor][:image]
      @doctor.email = params[:doctor][:email]
      @doctor.name = params[:doctor][:name]
      @doctor.specialization = params[:doctor][:specialization]
    end

    def index
      @doctors = Doctor.all
    end

    def show
      @patients = Patient.all
    end

    def new
    end

    def create
      if @doctor.save
        redirect_to doctor_path(@doctor)
        flash[:notice] = "Doctor account created!"
      else
        render :new
        flash[:notice] = "Account could not be created"
      end
    end

    def edit
    end

    def update
      if @doctor.save
        redirect_to doctors_path(@doctor)
        flash[:notice] = "Account updated!"
      else
        render doctors_path(@doctor)
        flash[:notice] = "Account could not be updated"
      end
    end

    def destroy
      @doctor.destroy
      redirect_to "/root"
      flash[:notice] = "Account deleted"
    end
end
