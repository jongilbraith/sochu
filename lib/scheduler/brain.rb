module Scheduler
  module Brain
    class << self

      def add_task_definition
        new_task_definition = Scheduler::TaskDefinition.new

        yield new_task_definition

        task_definitions << new_task_definition
      end

      def task_definitions
        @task_definitions ||= []
      end

      def upcoming_tasks
        task_definitions.collect(&:processor).collect(&:upcoming_tasks).flatten
      end

      def performed_tasks
        task_definitions.collect(&:processor).collect(&:performed_tasks).flatten
      end

      def due_tasks
        task_definitions.collect(&:processor).collect(&:due_tasks).flatten
      end

    end
  end
end
