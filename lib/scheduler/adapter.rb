module Scheduler
  module Adapter

    extend ActiveSupport::Concern

    class_methods do
      def schedule(method_name)
        task_definitions << Scheduler::TaskDefinition.new.tap do |definition|
          definition.klass = self
          definition.method_name = method_name
        end
      end

      def task_definitions
        @task_definitions ||= []
      end
    end

  end
end
