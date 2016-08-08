class CreateGuilds < ActiveRecord::Migration
  def change
    create_table :guilds do |t|

      t.timestamps null: false
    end
  end
end
