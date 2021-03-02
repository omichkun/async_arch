module Queries
  class TasksQuery
    def initialize(user)
      @user = user
    end

    def call
      if user.admin?
        Task.all
      end

      user.tasks
    end

    private
    attr_reader :user
  end
end