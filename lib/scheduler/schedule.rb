module Scheduler
  class Schedule

    attr_accessor :starts_at

    attr_accessor :ends_at

    def initialize(starts_at, ends_at)
      @starts_at = starts_at
      @ends_at = ends_at
    end

    def upcoming_tasks
      @upcoming_tasks ||= timeline.upcoming_tasks.sort_by(&:due_at)
    end

    def performed_tasks
      @performed_tasks ||= timeline.performed_tasks.sort_by(&:performed_at)
    end

    def due_tasks
      @due_tasks ||= timeline.due_tasks.sort_by(&:due_at)
    end

    def timeline
      @timeline ||= Scheduler::Schedule::Timeline.new.tap do |timeline|
        task_definitions.each do |definition|
          timeline.add_tasks(definition.processor.tasks_between(starts_at, ends_at))
        end
      end
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
