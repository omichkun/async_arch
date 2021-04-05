class AccountConsumer < ApplicationConsumer
  def consume
    data = payload[:data]
    user_params = {
      username: data[:full_name],
      active: data[:active]
    }
    User.find_by_public_id(data[:public_id]).update!(user_params)
  end
end