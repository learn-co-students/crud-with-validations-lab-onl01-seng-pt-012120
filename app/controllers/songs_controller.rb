class SongsController < ApplicationController





    # t.string   "title"
    # t.boolean  "released"
    # t.integer  "release_year"
    # t.string   "artist_name"
    # t.string   "genre"
    # t.datetime "created_at",   null: false
    # t.datetime "updated_at",   null: false

       def index
        @songs = Song.all
       end 

    def show
        @song = Song.find(params[:id])
      end
    
      def new
        @song = Song.new
      end
    
      def create
        @song = Song.new(author_params)
    
        if @song.valid?
          @song.save
          redirect_to author_path(@author)
        else
          render :new
        end
      end
    
      def edit
        @song = Song.find(params[:id])
      end
    
      def update
        @song = Song.find(params[:id])
        if @song.valid?
            @song.update(author_params)
          redirect_to author_path(@song)
        else
          render :edit
        end
      end
    
      def destroy
        @song.destroy!
        redirect_to songs_path
      end

      private
    
      def song_params
        params.permit( :title, :released, release_year, artist_name, genre)
      end
end
