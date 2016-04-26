module Scheduler
  class Schedule
    class Timeline

      def upcoming_tasks
        tasks.each_with_object([]) do |task, memo|
          memo << task if task.performed_at.blank? && task.due_at > Time.now
        end
      end

      def performed_tasks
        tasks.each_with_object([]) do |task, memo|
          memo << task if task.performed_at.present?
        end
      end

      def due_tasks
        tasks.each_with_object([]) do |task, memo|
          memo << task if task.performed_at.blank? && task.due_at <= Time.now
        end
      end

      def add_tasks(new_tasks)
        new_tasks.each { |t| tasks << t }
      end

      def tasks
        @tasks ||= []
      end

    end
  end
end
