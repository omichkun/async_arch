module Tasks
  class AssignAll
    include AbstractService

    def initialize(tasks, users)
      @tasks = tasks
      @users = users
    end

    def call
      all_users = users
      tasks.shuffle.each do |task|
        all_users.first.tasks << task
        all_users = all_users.rotate
      end
    end

    private
    attr_reader :tasks, :users
    attr_writer :users
  end
end