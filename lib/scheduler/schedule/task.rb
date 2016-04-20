module Scheduler
  module Schedule
    class Task

      attr_accessor :method_name, :record

      attr_accessor :due_at, :performed_at

      def perform!
        record.send(method_name)
      end

    end
  end
end
