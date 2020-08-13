class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(strong_dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
        redirect_to cocktails_path(@restaurant)
    else
        render :new
    end
  end

  def destroy
  end

  private

  def strong_dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end

