class ApplicationController < ActionController::Base

  before_action(:authenticate_patient!)
  before_action(:authenticate_doctor!)

end
