class AnimesController < ApplicationController
  # C-CREATE
  def create
    # Creamos un anime con la data que nos envian. Más info de esto abajo en params
    @anime = Anime.new(anime_params)

    # Intentamos guardar el anime que creamos.
    ## Guardar implica pasarlo a la base de datos, acá es donde se corre las validaciones que le hayamos puesto al modelo
    if @anime.save
      # Si las validaciones no tuvieron problemas, el anime se creó y le devolvemos al front el "show" de ese anime (ver más abajo show) y le avisamos que todo salió ok (status 200)
      render :show, status: :ok
    else
      # Si fallo, devolvemos los errores de porque fallo y le ponemos que falló el pedido (status 400)
      ## Un ejemplo de porque podría fallar el ".save" es porque pedimos que el nombre sea único e intentan crear un anime con el mismo nombre
      render json: { errors: @anime.errors }, status: :bad_request
    end
  end

  # R-READ

  ## Show es la acción que nos devuelve la vista de 1 elemento
  def show
    @anime = Anime.find(params[:id])
  end

  # Por que no tenemos un render algo aca?
  # Una accion por defecto va a buscar una view con el mismo nombre que la accion y devuelve eso si existe
  # por eso acá no ponemos "render :show" como en el craete porque sería reiterativo.
  # En el create lo queremos porque no tenemos una view de create si no que usamos la del show
  
  ## Por otra parte, queremos tener un endpoint que nos devuelva TODOS los animes que existen en una lista, esto es un "indice" del modelo
  def index
    # Si hacemos ".all" en un modelo nos devuelve todas las instancias de ese modelo
    ### notar el plural en el arroba porque son varios animes!! ###
    @animes = Anime.all

    # Como puse antes, acá rails hace render :index, status: :ok
  end


  # U - UPDATE
  def update
    @anime = Anime.find(params[:id])
      
    # Nos basta intentar actualizar el anime con la data que nos enviaron y ver si las validaciones devuelven todo ok
    if @anime.update(anime_params)
      # Similar a cuando en el create rendereamos show, queremos devolver el anime actualizado
      render :show, status: :ok
    else
      # Pucha, no se pudo actualizar, mejor le devuelvo al front los errores (similar al show)
      render json: { errors: @anime.errors }, status: :bad_request
    end
  end

  # D - DELETE
  def destroy
    @anime = Anime.find(params[:id])

    # Solo para chivear, agrego un extra que hace que no puedan borrar un anime
    if (!@anime.name.downcase.eql? "haikyu")
      if @anime.destroy
        # Como borramos no queremos devolver otra cosa que no sea el status 200
        render json: { status: :ok }
      else
        render json: { errors: @anime.errors, status: :bad_request }
      end
    else
      # No dejamos que borren haikyuu
      render json: { errors: "A vos te parece?", status: :not_acceptable }
    end
  end

  # Otro dia hablamos de este private
  private
    def anime_params
      params.require(:anime).permit(:name)
    end
end

