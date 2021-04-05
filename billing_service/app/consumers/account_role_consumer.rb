class AccountRoleConsumer < ApplicationConsumer
  def consume
    data = payload[:data]

    User.find_by_public_id(data[:public_id]).update(role: data[:role])
  end
end