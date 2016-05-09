class CreateWebscrappers < ActiveRecord::Migration
  def change
    create_table :webscrappers do |t|

      t.timestamps null: false
    end
  end
end
