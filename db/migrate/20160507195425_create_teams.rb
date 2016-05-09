class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.date :date_founded
      t.string :city
      t.string :stadium
      t.string :fans_nickname
      t.integer :country_id

      t.timestamps null: false
    end
  end
end
