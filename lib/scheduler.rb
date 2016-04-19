require_relative 'scheduler/schedule'
require_relative 'scheduler/adapter'

module Scheduler
end

# Ensure all models are loaded so as to pull in any rules
if !Rails.configuration.eager_load
  Rails.root.join('app', 'models').each_child do |child|
    require child if (child.file? && child.fnmatch?('*.rb'))
  end
end
