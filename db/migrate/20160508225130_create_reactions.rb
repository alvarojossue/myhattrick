class CreateReactions < ActiveRecord::Migration
  def change
    create_table :reactions do |t|
      t.integer :statement_id
      t.boolean :answer
      t.text :comment

      t.timestamps null: false
    end
  end
end
