class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def ensure_logged_in
    unless current_doctor || current_patient
      flash[:alert] = "You must be logged in to view this page"
      redirect_to root_path
    end
  end

  def ensure_doctor_logged_out
    unless !current_doctor
      redirect_to doctor_path(current_doctor)
    end
  end

  def ensure_patient_logged_out
    unless !current_patient
      redirect_to patient_path(current_patient)
    end
  end

end
