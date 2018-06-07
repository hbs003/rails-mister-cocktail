class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    # @ingredient = Ingredient.find(params[:ingredient_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(review_params)
    # we need `cocktail_id/ingredient_id` to asssociate review with corresponding restaurant
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @cocktail = @dose.cocktail
    # raise
    @dose.ingredient = Ingredient.find(params["dose"]["ingredient_id"])
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
     @dose = Dose.find(params[:id])
     @dose.destroy
     redirect_to cocktail_path(@cocktail)
  end

  private

  def review_params
    params.require(:dose).permit(:description)
  end
end
