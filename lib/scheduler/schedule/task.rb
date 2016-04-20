module Scheduler
  module Schedule
    class Task

      attr_accessor :rule, :record

      def due_at
        record.send(Scheduler::Schedule::Rule::DUE_AT_COLUMN)
      end

      def performed_at
        record.send(Scheduler::Schedule::Rule::PERFORMED_AT_COLUMN)
      end

      def perform!
        record.send(rule.method_name)
      end

    end
  end
end
