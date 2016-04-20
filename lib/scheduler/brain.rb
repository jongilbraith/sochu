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
        task_definitions.collect do |definition|
          TaskDefinition::Processor.new(definition).upcoming_task_records.collect do |record|
            Scheduler::Schedule::Task.new.tap do |task|
              task.method_name = definition.method_name
              task.record = record
            end
          end
        end.flatten
      end

      def performed_tasks
        task_definitions.collect do |definition|
          TaskDefinition::Processor.new(definition).performed_task_records.collect do |record|
            Scheduler::Schedule::Task.new.tap do |task|
              task.method_name = definition.method_name
              task.record = record
            end
          end
        end.flatten
      end

      def due_tasks
        task_definitions.collect do |definition|
          TaskDefinition::Processor.new(definition).due_task_records.collect do |record|
            Scheduler::Schedule::Task.new.tap do |task|
              task.method_name = definition.method_name
              task.record = record
            end
          end
        end.flatten
      end

    end
  end
end
