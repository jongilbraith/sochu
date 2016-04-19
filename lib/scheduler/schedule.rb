module Scheduler
  module Schedule
    class << self

      def add_rule
        new_rule = Scheduler::Schedule::Rule.new

        yield new_rule

        store << new_rule
      end

      def upcoming_tasks
        store.collect(&:upcoming_tasks).flatten.sort_by(&:due_at)
      end

      def performed_tasks
        store.collect(&:performed_tasks).flatten.sort_by(&:performed_at)
      end

      def due_tasks
        store.collect(&:due_tasks).flatten.sort_by(&:due_at)
      end

      private

      def store
        @store ||= []
      end

    end
  end
end
