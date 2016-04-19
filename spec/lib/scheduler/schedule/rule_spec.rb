require_relative '../../../rails_helper'

RSpec.describe Scheduler::Schedule::Rule do

  let(:rule) do
    described_class.new.tap do |new_rule|
      new_rule.klass = ScheduledUpdate
      new_rule.method_name = :_
      new_rule.due_at_column = :due_at
      new_rule.performed_at_column = :performed_at
    end
  end

  let(:due_update) { create(:scheduled_update, due_at: 1.minute.ago) }
  let(:upcoming_update) { create(:scheduled_update, due_at: 1.minute.from_now) }
  let(:performed_update) { create(:scheduled_update, due_at: 1.minute.ago, performed_at: 1.minute.ago) }

  describe '#upcoming_task_records' do
    subject { rule.send(:upcoming_task_records) }

    it { should include upcoming_update }
    it { should_not include due_update }
    it { should_not include performed_update }
  end

  describe '#performed_task_records' do
    subject { rule.send(:performed_task_records) }

    it { should include performed_update }
    it { should_not include due_update }
    it { should_not include upcoming_update }
  end

  describe '#due_task_records' do
    subject { rule.send(:due_task_records) }

    it { should include due_update }
    it { should_not include upcoming_update }
    it { should_not include performed_update }
  end
end
