module Scheduler
  module Schedule
    class << self

      def upcoming_tasks
        Scheduler::Brain.rules.collect(&:upcoming_tasks).flatten.sort_by(&:due_at)
      end

      def performed_tasks
        Scheduler::Brain.rules.collect(&:performed_tasks).flatten.sort_by(&:performed_at)
      end

      def due_tasks
        Scheduler::Brain.rules.collect(&:due_tasks).flatten.sort_by(&:due_at)
      end

    end
  end
end
