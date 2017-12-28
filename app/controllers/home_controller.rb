class HomeController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :sidebar]


  def index
  end

  def secret
  end

  def sidebar
  end

end
