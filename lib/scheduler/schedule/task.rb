module Scheduler
  module Schedule
    class Task

      attr_accessor :method_name, :record

      def due_at
        record.send(Scheduler::TaskDefinition::Processor::DUE_AT_COLUMN)
      end

      def performed_at
        record.send(Scheduler::TaskDefinition::Processor::PERFORMED_AT_COLUMN)
      end

      def perform!
        record.send(method_name)
      end

    end
  end
end
