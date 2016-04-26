module Scheduler
  class Schedule

    def upcoming_tasks
      task_definitions.collect(&:processor).collect(&:upcoming_tasks).flatten.sort_by(&:due_at)
    end

    def performed_tasks
      task_definitions.collect(&:processor).collect(&:performed_tasks).flatten.sort_by(&:performed_at)
    end

    def due_tasks
      task_definitions.collect(&:processor).collect(&:due_tasks).flatten.sort_by(&:due_at)
    end

    private

    def task_definitions
      @task_definitions ||= ActiveRecord::Base.
                              descendants.
                              collect { |k| k.try(:task_definitions) }.
                              flatten.
                              compact
    end

  end
end
