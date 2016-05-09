class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.integer :team_id
      t.string :title
      t.text :description
      t.date :date
      t.string :author
      t.string :image_url

      t.timestamps null: false
    end
  end
end
