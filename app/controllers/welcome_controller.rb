class WelcomeController < ApplicationController
  def index  
    @rest = Restaurante.all
  end 

  def create
  end
  
  def edit
  end
end
