class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/albums" do
    albums = Album.all
    albums.to_json
  end

  get "/albums/:id" do
    album = Album.find(params[:id])
    album.to_json
  end

  get '/top_rated_album' do
    album = Album.by_rating.first
    album.to_json
  end

  get '/songs' do
    songs = Song.all
    songs.to_json(include: :album)
  end

  get '/songs/:id' do
    song = Song.find(params[:id])
    song.to_json(include: :album)
  end

  get '/hottest_song' do
    song = Song.hottest_song
    song.to_json(include: :album)
  end

  get '/songs/album/:album_id' do
    songs = Song.where(album_id: params[:album_id])
    songs.to_json(include: :album)
  end

  patch '/songs/:id' do
    song = Song.find(params[:id])
    song.update(
      likes: params[:likes]
    )
    song.to_json(include: :album)
  end

  get '/comments' do
    comments = Comment.all
    comments.to_json(include: :album)
  end

  get '/comments/:id' do
    comment = Comment.find(params[:id])
    comment.to_json(include: :album)
  end

  get '/comments/album/:album_id' do
    comments = Comment.where(album_id: params[:album_id])
    comments.to_json(include: :album)
  end

  post '/comments' do
    comment = Comment.create(
      comment: params[:comment],
      album_id: params[:album_id]
    )
    comment.to_json(include: :album)
  end

  delete '/comments/:id' do
    comment = Comment.find(params[:id])
    comment.destroy
    comment.to_json
  end

end
