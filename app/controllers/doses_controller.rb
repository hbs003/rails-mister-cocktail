class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def new
    # @cocktail = Cocktail.find(params[:cocktail_id])
    # @ingredient = Ingredient.find(params[:ingredient_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(review_params)
    # we need `cocktail_id/ingredient_id` to asssociate review with corresponding restaurant
    @dose.cocktail = @cocktail
    @cocktail = @dose.cocktail
    @dose.ingredient = Ingredient.find(params["dose"]["ingredient_id"])
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
     @dose = Dose.find(params[:id])
     cocktail = @dose.cocktail
     @dose.destroy
     redirect_to cocktail_path(cocktail)
  end

  private

  def review_params
    params.require(:dose).permit(:description)
  end

  def set_cocktail
   @cocktail = Cocktail.find(params[:cocktail_id])
  end


end
