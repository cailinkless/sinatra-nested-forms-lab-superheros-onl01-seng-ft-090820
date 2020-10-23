require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post '/team' do
        #make team
        @team = Team.new(params[:team])
        #iterate to make heroes
        params[:team][:heroes].each do |details|
            Hero.new(details)
        end
        @heroes = Hero.all
        erb :team
    end


end
