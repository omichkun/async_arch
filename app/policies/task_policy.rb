class TaskPolicy
  def initialize(user)
    @user = user
  end

  def can_assign?
    return true if %w[administrator manager].include?(user.role.name)

    false
  end

  def can_close?(task)
    return true if user.id == task.user.id

    false
  end

  private
  attr_reader :user
end