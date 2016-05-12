class RemoveWebscrappersTable < ActiveRecord::Migration
  def change
  	drop_table :webscrappers
  end
end
