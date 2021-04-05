class TaskPresenter < SimpleDelegator
  def task_user
    self.try(:user).present? ? self.user.username || self.user.email : '-'
  end
end