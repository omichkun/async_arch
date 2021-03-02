class UserPolicy
  def initialize(user)
    @user = user
  end

  def is_admin?
    return true if user.role.name == 'administrator'

    false
  end

  private
  attr_reader :user
end