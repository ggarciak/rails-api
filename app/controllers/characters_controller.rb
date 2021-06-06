class CharactersController < ApplicationController
  # Viste que en el anime controller tanto en show, update y destroy teniamos que ir a buscar la instancia del modelo?
  # Ahora ponemos una funcion que lo haga por nosotros y la ejecutamos en esas acciones
  before_action :set_character, only: [:show, :update, :destroy]

  def create
    @character = Character.new(character_params)

    if @character.save
      render :show, status: :ok
    else
      render json: { errors: @character.errors }, status: :bad_request
    end
  end

  def show
  end

  def index
    @characters = Character.all
  end

  def update
    if @character.update(character_params)
      render :show, status: :ok
    else
      render json: { errors: @character.errors }, status: :bad_request
    end
  end

  def destroy
    if @character.destroy
      render json: { status: :ok }
    else
      render json: { errors: @character.errors }, status: :bad_request
    end
  end

  private
    def set_character
      @character = Character.find(params[:id])
    end

    def character_params
      params.require(:character).permit(:name, :biography, :anime_id)
    end
end

