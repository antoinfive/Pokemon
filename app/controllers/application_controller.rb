class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }
  require 'pry'

  get '/' do
    erb :welcome
  end

  get '/owner/new' do
    erb :newowner
  end

  post '/owner' do
    @owner = Owner.create(name: params[:owner][:name], avatar_url: params[:owner][:avatar_url])
    redirect "/owner/#{@owner.id}"
  end

  get '/owner' do
    @owners = Owner.all
    erb :index
  end

  get '/owner/:id' do
    @owner = Owner.find(params[:id])
    erb :show
  end

  get '/owner/:id/edit' do
    @owner = Owner.find(params[:id])
    erb :edit
  end

  post '/owner/:id' do
    @owner = Owner.find(params[:id])
    ids = params[:owner]
    if @owner.pocketmonsters.empty?
      @owner.update(ids)
    else
      pokemon = Pocketmonster.find(params[:owner][:pocketmonster_ids])
      @owner.pocketmonsters << pokemon
    end
    unless params[:avatar_url].nil?
      @owner.update(params[:avatar_url])
    end
    redirect "/owner/#{@owner.id}"
  end

  post '/owner/:id/delete' do
    @owner = Owner.find(params[:id])
    @owner.destroy
    redirect '/owner'
  end

  post '/pokemon/:id/delete' do
    @pokemon = Pocketmonster.find(params[:id])
    @owner = @pokemon.owner
    @owner.pocketmonsters.delete(params[:id])
    redirect "/owner/#{@owner.id}"
  end

  get '/pokemon/new' do
    erb :newpokemon
  end

  post '/pokemon' do
    @pokemon = Pocketmonster.create(name: params[:poke][:name], image_url: params[:poke][:image_url])
    redirect '/'
  end
end
