class ArtistsController < ApplicationController
  before_action :find_artist, only: [:show, :destroy]

   def index
      @artists = Artist.all
    end

    def show
      @artist = Artist.find(params[:id])
    end


   private

  def find_artist
    @artist = Artist.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :artist_id)
  end

end
