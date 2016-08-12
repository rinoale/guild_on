class Guild < ActiveRecord::Base
  has_many :guild_board

  validates :guild_address, :guild_name, :guild_master, presence: { message: 'can not be empty' }

  def to_param
    guild_address
  end
end
