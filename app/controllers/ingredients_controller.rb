require "pry"
class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :delete, :update]

  def new
    @ingredient = Ingredient.new
  end

  def create
    # binding.pry
    @ingredient = Ingredient.new(ingredient_params(params))
    @ingredient.save
    # binding.pry
    redirect_to ingredient_path(@ingredient)
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
    @ingredient.update(ingredient_params(params))
    if @ingredient.save
      redirect_to @ingredient
    end
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params(params)
    params.require(:ingredient).permit(:name)
  end

end
