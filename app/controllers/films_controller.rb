class FilmsController < ApplicationController

  def new
    @film = Film.new

  end

  def create
    @film = Film.new(film_params)
    if @film.valid?
      @film.save
      redirect_to @film
    else
      render :new
    end
  end

  def show
    @film = Film.find(params[:id])
  end

  def index
    @films = Film.all
  end

  private

  def film_params
    params.require(:film).permit(:title, :director, :studio)
  end
 
end