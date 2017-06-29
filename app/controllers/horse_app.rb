
class HorseApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    redirect '/horses'
  end

  get '/horses' do
    @horses = Horse.all
    erb :"horses/index"
  end

  get '/horses/new' do
    erb :"horses/new"
  end

  get '/horses/:id' do
    @horse = Horse.find(params[:id])
    erb :"horses/show"
  end

  get '/jockey/:id' do |id|
    @jockey = Jockey.find(id)
    @horses = @jockey.horses
    @jockey_winnings = @horses.sum("total_winnings")
    @jockey_winning_average = @horses.average("total_winnings")
    erb :"jockeys/show"
  end

  post '/horses' do
    # require 'pry'; binding.pry
    horse = Horse.new(params[:horse])
    horse.save
    redirect "/horses/#{horse.id}"
  end

  get '/horses/:id/edit' do
    @horse = Horse.find(params[:id])
    erb :"horses/edit"
  end

  put '/horses/:id' do |id|
    Horse.update(id.to_i, params[:horse])
    redirect "/horses/#{id}"
  end

  delete '/horses/:id' do |id|
    Horse.destroy(id.to_i)
    redirect '/horses'
  end

end
