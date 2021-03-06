class Api::SongsController < ApplicationController
    skip_before_action :verify_authenticity_token

  def index
    render status: 200, json: {
      songs: Song.all
    }.to_json
  end

  def show
    song = Song.find(params[:id])

    render status: 200, json: {
      song: song
    }.to_json
  end

  def create
    song = Song.new(song_params)

    if song.save
      render status: 201, json: {
        message: "Song created",
        song: song
      }.to_json
    end
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end

end
