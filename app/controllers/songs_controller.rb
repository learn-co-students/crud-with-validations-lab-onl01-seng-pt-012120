class SongsController < ApplicationController

    def index
        @songs=Song.all
    end

    def new 
        @song=Song.new
    end

    def create
        @song=Song.new(song_params)
        #use new NOT create method to save song instance 
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end


    def show
        set_song!
    end

    def edit
        set_song! 
        if @song 
            render :edit 
        else
            redirect_to songs_path
        end
        #isn't the if else block implicit?
    end

    def update
        set_song!
        @song=Song.update(song_params)
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :index
        end
    end

    def destroy 
        Song.find_by(id: params[:id]).destroy
        redirect_to songs_url
    end

    private

     #whitelist/strong params/protected
    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

    def set_song!
        @song=Song.find_by(id: params[:id])
        #use find_by to access :id keys
    end
end
