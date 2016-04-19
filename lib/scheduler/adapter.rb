module Scheduler
  module Adapter

    extend ActiveSupport::Concern

    class_methods do
      def scheduler(perform:, at:, record_in:)
        Scheduler::Schedule.add_rule(self, perform, at, record_in)
      end
    end

  end
end
