class GamesController < ApplicationController
  # before_action :set_game, only: %i[show edit update destroy]

  # GET /games
  def index
    @games = Game.all
  end

  # GET /games/1
  def show
    @game = Game.find(params[:id])
    @involved = InvolvedCompany.where(game: @game).order(developer: :desc)
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game, notice: "Game was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to @game, notice: "Game was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path, notice: "Game was successfully destroyed."
  end

  # POST /games/:id/add_genre
  def add_genre
    game = Game.find(params[:id])
    genre = Genre.find(params[:genre_id])

    game.genres << genre
    redirect_to game
  end

  # DELETE /games/:id/remove_genre
  def remove_genre
    game = Game.find(params[:id])
    genre = Genre.find(params[:genre_id])

    game.genres.delete(genre)
    redirect_to game, status: :see_other
  end

  # POST /games/:id/add_platform
  def add_platform
    game = Game.find(params[:id])
    platform = Platform.find(params[:platform_id])

    game.platforms << platform
    redirect_to game
  end

  # DELETE /games/:id/remove_platform
  def remove_platform
    game = Game.find(params[:id])
    platform = Platform.find(params[:platform_id])

    game.platforms.delete(platform)
    redirect_to game, status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_game
  # @game = Game.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:name, :summary, :release_date, :category, :rating, :parent_id,
                                 :cover)
  end
end
