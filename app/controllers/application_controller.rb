class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_league
    @_league ||= League.where(:current => true).first
  end
end
