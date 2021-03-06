class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
    @tasks = current_user.tasks.open
  end

  def all
    # очень неоптимально, но для попугов сойдет
    @tasks = Task.all.order(:status, :created_at).map { |task| TaskPresenter.new(task) }
    @button = AssignAllTasksPresenter.new(current_user, view_context)
  end

  def assign_all
    return error!(status: 403) unless TaskPolicy.new(current_user).can_assign?

    tasks = Task.open
    Tasks::AssignAll.call(tasks, User.all)
    redirect_to all_tasks_path
  end

  def close
    task = Task.find(params[:id])
    return error!(status: 403) unless TaskPolicy.new(current_user).can_close?(task)

    Tasks::Close.call(task)
    redirect_to tasks_path
  end

  def show
    @task = TaskPresenter.new(@task)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :user_id, :status)
  end
end
