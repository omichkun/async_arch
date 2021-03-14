class AssignAllTasksPresenter

  def initialize(current_user, view_context)
    @user = current_user
    @view_context = view_context
  end

  def button
    return '' unless TaskPolicy.new(user).can_assign?

    view_context.link_to(
      'ASSIGN ALL TASKS',
      view_context.assign_all_tasks_path,
      class: 'btn btn-success',
      method: :post)
  end

  private
  attr_reader :view_context, :user
end