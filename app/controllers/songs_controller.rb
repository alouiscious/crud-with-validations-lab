class SongsController < ApplicationController

  # before_action :set_song, only: [:show, :edit, :create, :update]

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
    redirect_to edit_song_path(@song)
  end

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end  

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def update
    @song = Song.find(params[:id])
    @song = Song.update(song_params)
    redirect_to song_path(@song)

    if !Song.update(song_params)
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end

  private
  # def set_song
  #   @song = Song.find(params[:id])
  # end

  def song_params
    params.require(:song).permit(:title, :artist_name, :genre, :released, :release_year)
    # params.permit(:title, :artist_name, :genre, :released, :release_year)

  end
end
