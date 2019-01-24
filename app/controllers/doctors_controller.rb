class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor.name = params[:doctors][:name]
    @doctor.specialization = params[:doctors][:specialization]

    if @doctor.save
      redirect_to doctors_path(@doctor)
      flash[:notice] = "We added you!"
    else
      render :new
      flash[:notice] = "We added you!"
    end
  end


  def destroy
    @doctor.destroy
    redirect_to "/root"
    flash[:notice] = "You deleted"
  end

end
