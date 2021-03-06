class CocktailsController < ApplicationController

  before_action :all_cocktails

  def index
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new # bc this is where I create a new dose, instead of in a new method in doses_controller
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, photos: [])
  end

  def all_cocktails
    @cocktails = Cocktail.all
  end
end


