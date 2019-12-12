class SongsController < ApplicationController

  def index
    @songs = Song.all
    route :'/'
    
  end

  def show
    set_song
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    set_song
  end

  def update
    set_song
    if @song = Song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def delete
    set_song.destroy
    redirect_to song_path(@song)
  end

  private

  def song_params
    params.require(:songs).permit(:name, :artist_name, :genre, :released, :release_year)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
