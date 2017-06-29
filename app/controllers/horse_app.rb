class HorseApp < Sinatra::Base

  get '/horses' do
    @horses = Horse.all
    erb :"horses/index"
  end

  get 'jockey/:id' do |id|
    @jockey = Jockey.find(id)
    erb :"jockeys/show"
  end

end
