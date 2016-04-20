module Scheduler
  class TaskDefinition
    class Processor

      DUE_AT_COLUMN = :due_at
      PERFORMED_AT_COLUMN = :performed_at

      attr_accessor :definition

      def initialize(task_definition)
        @definition = task_definition
      end

      def upcoming_task_records
        definition.klass.where("#{DUE_AT_COLUMN} > ?", Time.now)
      end

      def performed_task_records
        definition.klass.where("#{PERFORMED_AT_COLUMN} IS NOT NULL")
      end

      def due_task_records
        definition.
          klass.
          where("#{PERFORMED_AT_COLUMN} IS NULL").
          where("#{DUE_AT_COLUMN} <= ?", Time.now)
      end

    end
  end
end
