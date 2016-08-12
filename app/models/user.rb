class User < ActiveRecord::Base
  has_secure_password

  def admin?
    self.account_level == 100
  end

  def manager?
    self.account_level == 90
  end

  def guild_master?
    self.account_level == 1
  end
end
