module Scheduler
  module Adapter

    extend ActiveSupport::Concern

    class_methods do
      def schedule(method_name)
        Scheduler::Brain.add_rule do |rule|
          rule.klass = self
          rule.method_name = method_name
        end
      end
    end

  end
end
