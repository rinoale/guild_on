class AddGuildAddressToGuilds < ActiveRecord::Migration
  def change
    add_column :guilds, :guild_address, :string
    add_index :guilds, :guild_address, unique: true
  end
end
