class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :delete, :update]

  def new
    @ingredients = Ingredient.all
    @recipe = Recipe.new
  end

  def create
    # binding.pry
    @recipe = Recipe.new(recipe_params(params))
    @recipe.save
    # binding.pry
    redirect_to recipe_path(@recipe)
  end

  def show
  end

  def index
  end

  def edit
    @ingredients = Ingredient.all
  end

  def update
    @recipe.update(recipe_params(params))
    if @recipe.save
      @recipe.ingredients.clear if !params[:recipe][:ingredient_ids]
      @recipe.save
      redirect_to @recipe
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params(params)
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
