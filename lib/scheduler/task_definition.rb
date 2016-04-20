module Scheduler
  class TaskDefinition

    attr_accessor :klass, :method_name

    def processor
      Processor.new(self)
    end

  end
end
