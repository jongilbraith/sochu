module Scheduler
  module Brain
    class << self

      def add_rule
        new_rule = Scheduler::Schedule::Rule.new

        yield new_rule

        rules << new_rule
      end

      def rules
        @rules ||= []
      end

    end
  end
end
