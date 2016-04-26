module Scheduler
  class Schedule

    def upcoming_tasks
      brain.upcoming_tasks.sort_by(&:due_at)
    end

    def performed_tasks
      brain.performed_tasks.sort_by(&:performed_at)
    end

    def due_tasks
      brain.due_tasks.sort_by(&:due_at)
    end

    def task_definitions
      @task_definitions ||= ActiveRecord::Base.
                              descendants.
                              collect { |k| k.try(:task_definitions) }.
                              flatten.
                              compact
    end

    private

    def brain
      @brain ||= Scheduler::Brain.new(self)
    end

  end
end
