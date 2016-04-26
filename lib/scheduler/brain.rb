module Scheduler
  class Brain

    attr_accessor :schedule

    def initialize(schedule)
      @schedule = schedule
    end

    def upcoming_tasks
      schedule.task_definitions.collect(&:processor).collect(&:upcoming_tasks).flatten
    end

    def performed_tasks
      schedule.task_definitions.collect(&:processor).collect(&:performed_tasks).flatten
    end

    def due_tasks
      schedule.task_definitions.collect(&:processor).collect(&:due_tasks).flatten
    end

  end
end
