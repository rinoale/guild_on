class Guild < ActiveRecord::Base
  def to_param
    guild_address
  end
end
