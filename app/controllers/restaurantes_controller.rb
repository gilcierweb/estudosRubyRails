class RestaurantesController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @restaurantes = Restaurante.order('id desc').page(params['page']).per(10)
    respond_with @restaurantes
  end

  def show
    @restaurante = Restaurante.find(params[:id])
    respond_with @restaurante
  end

  def new
    @restaurante = Restaurante.new
  end

  def create
    @restaurante = Restaurante.new(restaurante_params)
    if @restaurante.save
      redirect_to action: "show", id: @restaurante
    else
      render action: "new"
    end
  end

  def edit
    @restaurante = Restaurante.find(params[:id])
  end

  def update
    @restaurante = Restaurante.find params[:id]

    if @restaurante.update_attributes(restaurante_params)
      redirect_to action: "show", id: @restaurante
    else
      render action: "edit"
    end
  end

  def destroy
    @restaurante = Restaurante.find(params[:id])
    @restaurante.destroy
    redirect_to action: 'index'
  end

  def restaurante_params
    params.require(:restaurante).permit(:nome, :endereco, :especialidade, :foto)
  end
end
