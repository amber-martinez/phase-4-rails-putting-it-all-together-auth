class RecipesController < ApplicationController

    def index
        recipes = Recipe.all
        render json: recipes, each_serializer: RecipeSerializer
    end

    def create
        recipe = Recipe.create!(title: params[:title], instructions: params[:instructions], minutes_to_complete: params[:minutes_to_complete], user_id: @user.id )
        render json: recipe, status: :created
    end

    private

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete, :user_id)
    end


end
