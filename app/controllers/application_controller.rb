class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # En autentiserad användare måste finnas innan händelser i applikationen kan utföras.
  before_action :authenticate_user!
end
