module Scheduler
  class TaskDefinition
    class Processor

      DUE_AT_COLUMN = :due_at
      PERFORMED_AT_COLUMN = :performed_at

      attr_accessor :definition

      def initialize(task_definition)
        @definition = task_definition
      end

      def upcoming_tasks
        upcoming_task_records.collect do |record|
          Scheduler::Schedule::Task.new.tap do |task|
            task.method_name = definition.method_name
            task.record = record
            task.due_at = record.send(DUE_AT_COLUMN)
            task.performed_at = record.send(PERFORMED_AT_COLUMN)
          end
        end
      end

      def performed_tasks
        performed_task_records.collect do |record|
          Scheduler::Schedule::Task.new.tap do |task|
            task.method_name = definition.method_name
            task.record = record
            task.due_at = record.send(DUE_AT_COLUMN)
            task.performed_at = record.send(PERFORMED_AT_COLUMN)
          end
        end
      end

      def due_tasks
        due_task_records.collect do |record|
          Scheduler::Schedule::Task.new.tap do |task|
            task.method_name = definition.method_name
            task.record = record
            task.due_at = record.send(DUE_AT_COLUMN)
            task.performed_at = record.send(PERFORMED_AT_COLUMN)
          end
        end
      end

      private

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
