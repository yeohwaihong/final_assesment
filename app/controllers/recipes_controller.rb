class RecipesController < ApplicationController
  def index
  	@search_term = params[:looking_for] || 'carbonara'
  	@recipes = Recipe.for(@search_term)
  end
end
