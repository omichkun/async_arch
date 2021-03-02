class TaskPresenter < SimpleDelegator
  def task_user
    self.try(:user).present? ? self.user.username : 'unassigned'
  end
end