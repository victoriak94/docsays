class ApplicationController < ActionController::Base
  before_action :authentication_patients!
  
end
