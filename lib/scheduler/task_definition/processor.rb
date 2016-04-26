module Scheduler
  class TaskDefinition
    class Processor

      DUE_AT_COLUMN = :due_at
      PERFORMED_AT_COLUMN = :performed_at

      attr_accessor :definition

      def initialize(task_definition)
        @definition = task_definition
      end

      def tasks_between(from, to)
        records.where("#{DUE_AT_COLUMN} > ? AND #{DUE_AT_COLUMN} < ?", from, to).collect do |record|
          Scheduler::Schedule::Task.new.tap do |task|
            task.method_name = definition.method_name
            task.record = record
            task.due_at = record.send(DUE_AT_COLUMN)
            task.performed_at = record.send(PERFORMED_AT_COLUMN)
          end
        end
      end

      private

      def records
        definition.klass
      end

    end
  end
end
