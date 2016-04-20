module Scheduler
  module Schedule
    class Rule

      DUE_AT_COLUMN = :due_at
      PERFORMED_AT_COLUMN = :performed_at

      attr_accessor :klass, :method_name

      def upcoming_task_records
        klass.where("#{DUE_AT_COLUMN} > ?", Time.now)
      end

      def performed_task_records
        klass.where("#{PERFORMED_AT_COLUMN} IS NOT NULL")
      end

      def due_task_records
        klass.
          where("#{PERFORMED_AT_COLUMN} IS NULL").
          where("#{DUE_AT_COLUMN} <= ?", Time.now)
      end

    end
  end
end
