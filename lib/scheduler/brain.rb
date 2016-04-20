module Scheduler
  module Brain
    class << self

      def add_rule
        new_rule = Scheduler::Schedule::Rule.new

        yield new_rule

        rules << new_rule
      end

      def rules
        @rules ||= []
      end

      def upcoming_tasks
        rules.collect do |rule|
          rule.upcoming_task_records.collect do |record|
            Scheduler::Schedule::Task.new.tap do |task|
              task.rule = rule
              task.record = record
            end
          end
        end.flatten
      end

      def performed_tasks
        rules.collect do |rule|
          rule.performed_task_records.collect do |record|
            Scheduler::Schedule::Task.new.tap do |task|
              task.rule = rule
              task.record = record
            end
          end
        end.flatten
      end

      def due_tasks
        rules.collect do |rule|
          rule.due_task_records.collect do |record|
            Scheduler::Schedule::Task.new.tap do |task|
              task.rule = rule
              task.record = record
            end
          end
        end.flatten
      end

    end
  end
end
