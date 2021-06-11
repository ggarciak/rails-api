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

  # El metodo parece estar bien!
  # No sabía como se hacía esto ni conocía each_slice jajaja
  # Tip del nombre: Está bueno que describa que es lo que hace
  # Ej: get_decks
  def deck
    characters = Character.all.shuffle
    
    if (characters.length % 2)
      decks = characters.each_slice(characters.length/2).to_a
    else
      characters.pop()
      decks = characters.each_slice(characters.length/2).to_a
    end

  
    # Tip de código, fijate que la linea 45 es igual a la 48, entonces no depende del if

    # Para esto podes negar el if
    #   if !(characters.length % 2)
    #      characters.pop
    #   end
    #
    #   decks = ...

    # Extra tip: En rails el "if !" tiene un nombre, y es unless

    # unless (characters.length % 2)
    #   characters.pop
    # end

    # Este tip es porque se me dió la oportunidad pero no es relavnte

    # -----------------------------

    # Otro tip de código choto (en la misma linea que lo anterior), las siguientes
    # dos lineas se pueden resumir a:

    # @first_deck, @second_deck = decks

    # Esto es array destructuring.

    # -----------------------------

    # Ultima bobada: No está bueno tener variables con numero

    @deck1 = decks[0]
    @deck2 = decks[1]
  end

  private
    def set_character
      @character = Character.find(params[:id])
    end

    def character_params
      params.require(:character).permit(:name, :biography, :anime_id)
    end

  end

