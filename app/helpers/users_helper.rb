module UsersHelper
  def send_auth_code username
  end

  def encode_username username
    if username.match /[[:alpha]]/
      username
    else
      buffer_array = username.encode(Encoding::EUC_KR).unpack 'H2' * (username.length * 2)
      kor_name = buffer_array.map do |value| '%' + value.upcase end.join
    end
  end

  def trial_exceeded? username
    return true if AuthTrial.get(username) == '3'

    trial = AuthTrial.get username

    AuthTrial.set username, (trial.nil? ? 1 : Integer(trial) + 1)

    false
  end
end
