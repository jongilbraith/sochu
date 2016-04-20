module Scheduler
  module Adapter

    extend ActiveSupport::Concern

    class_methods do
      def schedule(method_name)
        Scheduler::Brain.add_task_definition do |definition|
          definition.klass = self
          definition.method_name = method_name
        end
      end
    end

  end
end
