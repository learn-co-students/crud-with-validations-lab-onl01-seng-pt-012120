class AddSongsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.boolean :released, default: true
      t.integer :release_year
      t.string :artist_name
      t.string :genre 
    end  
  end
end
