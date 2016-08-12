class GuildBoard < ActiveRecord::Base
  belongs_to :guild

  validates :title, :content, :author, presence: { message: 'can not be empty' }
end
