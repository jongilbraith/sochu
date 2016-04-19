module Scheduler
  module Schedule
    class Rule

      attr_accessor :klass, :method_name

      attr_accessor :due_at_column, :performed_at_column

      def upcoming_tasks
        upcoming_task_records.collect do |record|
          Scheduler::Schedule::Task.new.tap do |task|
            task.rule = self
            task.record = record
          end
        end
      end

      def performed_tasks
        performed_task_records.collect do |record|
          Scheduler::Schedule::Task.new.tap do |task|
            task.rule = self
            task.record = record
          end
        end
      end

      def due_tasks
        due_task_records.collect do |record|
          Scheduler::Schedule::Task.new.tap do |task|
            task.rule = self
            task.record = record
          end
        end
      end

      private

      def upcoming_task_records
        klass.where("#{due_at_column} > ?", Time.now)
      end

      def performed_task_records
        klass.where("#{performed_at_column} IS NOT NULL")
      end

      def due_task_records
        klass.
          where("#{performed_at_column} IS NULL").
          where("#{due_at_column} <= ?", Time.now)
      end

    end
  end
end
