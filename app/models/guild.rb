class Guild < ActiveRecord::Base
  has_many :guild_board

  def to_param
    guild_address
  end
end
