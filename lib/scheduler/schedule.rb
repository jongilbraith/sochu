module Scheduler
  module Schedule
    class << self

      def upcoming_tasks
        Scheduler::Brain.upcoming_tasks.sort_by(&:due_at)
      end

      def performed_tasks
        Scheduler::Brain.performed_tasks.sort_by(&:performed_at)
      end

      def due_tasks
        Scheduler::Brain.due_tasks.sort_by(&:due_at)
      end

    end
  end
end
