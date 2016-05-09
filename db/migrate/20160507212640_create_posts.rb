class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :team_id
      t.string :title
      t.string :image_url
      t.date :date
      t.string :author
      t.text :content
      t.string :source

      t.timestamps null: false
    end
  end
end
