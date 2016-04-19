module Scheduler
  module Schedule
    class Task

      attr_accessor :rule, :record

      def due_at
        record.send(rule.due_at_column)
      end

      def performed_at
        record.send(rule.performed_at_column)
      end

      def perform!
        record.send(rule.method_name)
      end

    end
  end
end
