require_relative '../../../rails_helper'

RSpec.describe Scheduler::TaskDefinition::Processor do
  let(:task_definition) { double(klass: ScheduledUpdate, method_name: double) }
  let(:processor) { described_class.new(task_definition) }

  let(:due_update) { create(:scheduled_update, due_at: 1.minute.ago) }
  let(:upcoming_update) { create(:scheduled_update, due_at: 1.minute.from_now) }
  let(:performed_update) { create(:scheduled_update, due_at: 1.minute.ago, performed_at: 1.minute.ago) }

  describe '#upcoming_task_records' do
    subject { processor.send(:upcoming_task_records) }

    it { should include upcoming_update }
    it { should_not include due_update }
    it { should_not include performed_update }
  end

  describe '#performed_task_records' do
    subject { processor.send(:performed_task_records) }

    it { should include performed_update }
    it { should_not include due_update }
    it { should_not include upcoming_update }
  end

  describe '#due_task_records' do
    subject { processor.send(:due_task_records) }

    it { should include due_update }
    it { should_not include upcoming_update }
    it { should_not include performed_update }
  end
end
