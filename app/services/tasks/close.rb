module Tasks
  class Close
    include AbstractService

    def initialize(task)
      @task = task
    end

    def call
      task.update(status: :closed)
    end

    private
    attr_reader :task, :user
  end
end