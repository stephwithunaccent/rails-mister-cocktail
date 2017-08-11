class DosesController < ApplicationController
  before_action :find_cocktail, only: [ :create ]

  def create
    @dose = @cocktail.doses.build(dose_params) # mon cocktail a plusieurs doses
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show' # not new anymore as we form is in show-page
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to @dose.cocktail
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
