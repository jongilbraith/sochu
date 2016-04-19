module Scheduler
  module Adapter

    extend ActiveSupport::Concern

    class_methods do
      def scheduler(perform:, at:, record_in:)
        Scheduler::Schedule.add_rule do |rule|
          rule.klass = self
          rule.method_name = perform
          rule.due_at_column = at
          rule.performed_at_column = record_in
        end
      end
    end

  end
end
