class HomeController < ApplicationController
  before_action :ensure_doctor_logged_out
  before_action :ensure_patient_logged_out
  
  def index
  end
end
