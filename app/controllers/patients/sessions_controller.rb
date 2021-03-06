# frozen_string_literal: true

class Patients::SessionsController < Devise::SessionsController
  before_action :ensure_doctor_logged_out
  before_action :ensure_patient_logged_out, except: [:destroy]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def after_sign_in_path_for(patient)
    patient_path(patient)
  end

end
