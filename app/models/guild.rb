class Guild < ActiveRecord::Base
  has_many :guild_board

  validates :guild_address, :guild_name, :guild_master, presence: { message: 'can not be empty' }
  validates :guild_address, format: { with: /\A[a-z]+\z/, message: 'can have only lowercase letters' }

  def to_param
    guild_address
  end
end
