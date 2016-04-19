module Scheduler
  module Schedule
    class << self

      def add_task(klass, command, timestamp_column, record_in_column)
        store << [klass, command, timestamp_column, record_in_column]
      end

      def upcoming_tasks
        store.each_with_object({}) do |(klass, method_name, timestamp_column, record_in_column), memo|
          memo[klass] ||= {}
          memo[klass][method_name] = klass.
                                       where("#{timestamp_column} > ?", Time.now).
                                       order(timestamp_column => :asc)
        end
      end

      def performed_tasks
        store.each_with_object({}) do |(klass, method_name, timestamp_column, record_in_column), memo|
          memo[klass] ||= {}
          memo[klass][method_name] = klass.
                                       where("#{record_in_column} IS NOT NULL").
                                       order(record_in_column => :desc)
        end
      end

      def due_tasks
        store.each_with_object({}) do |(klass, method_name, timestamp_column, record_in_column), memo|
          memo[klass] ||= {}
          memo[klass][method_name] = klass.
                                       where("#{record_in_column} IS NULL").
                                       where("#{timestamp_column} <= ?", Time.now).
                                       order(timestamp_column => :asc)
        end
      end

      private

      def store
        @store ||= []
      end

    end
  end
end
