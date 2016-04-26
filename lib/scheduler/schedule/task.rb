module Scheduler
  class Schedule
    class Task

      attr_accessor :method_name, :record

      attr_accessor :due_at, :performed_at

      def perform!
        record.send(method_name)

        # Ideally should be set from the timestamp on the record
        performed_at = Time.now
      end

    end
  end
end
