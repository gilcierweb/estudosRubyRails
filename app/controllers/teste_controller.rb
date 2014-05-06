class TesteController < ApplicationController
  def index
  end

  def form
    @dados = params[:q]
  end
end
