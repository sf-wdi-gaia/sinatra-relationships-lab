class SongsApp < Sinatra::Base
    get '/' do
        @songs = Song.all
        p "Songs from controller: "
        p @songs
        p "****"
        erb :index
    end

    get '/songs' do 
        @songs = Song.all
        erb :index
    end

    get '/songs/new' do 
        erb :new
    end

    post '/songs' do
        # p params
        @song = Song.create(params[:song])
        @song.save
        redirect '/'
    end

    get '/songs/:id' do
      @songs = Song.all
      @songs = Song.find(params[:id])
      @song.title
    end

    get '/songs/show/:id' do
        @song = Song.find(params[:id])
        erb :show
    end

    post '/songs/:id' do
        @song = Song.find(params[:id])
        @song.destroy
        redirect('/songs')
    end

end