class HorseApp < Sinatra::Base

  get '/horses' do
    @horses = Horse.all
    erb :"horses/index"
  end

  get '/jockey/:id' do |id|
    @jockey = Jockey.find(id)
    @horses = @jockey.horses
    @jockey_winnings = @horses.sum("total_winnings")
    @jockey_winning_average = @horses.average("total_winnings")
    erb :"jockeys/show"
  end

end
