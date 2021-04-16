class BottlesController < ApplicationController
  def index
    @bottles = Bottle.all
  end

  def show
    @bottle = Bottle.find(params[:id])
  end

  def new
    @bottle = Bottle.new
  end

  def create
    @bottle = Bottle.new(bottle_params)
    if @bottle.save
      redirect_to bottles_path
    else
      render :new
    end
  end

  def edit
    @bottle = Bottle.find(params[:id])
  end

  def update
    @bottle = Bottle.find(params[:id])
    if @bottle.update(bottle_params)
      redirect_to bottles_path
    else
      render :edit
    end
  end

  private

  def bottle_params
    params.require(:bottle).permit(:description, :price, :name, :wine_maker, :photo)
  end

end
