require_relative '../../rails_helper'

RSpec.describe Scheduler::Schedule do

  let(:due_update) { create(:scheduled_update, due_at: 1.minute.ago) }
  let(:upcoming_update) { create(:scheduled_update, due_at: 1.minute.from_now) }
  let(:performed_update) { create(:scheduled_update, due_at: 1.minute.ago, performed_at: 1.minute.ago) }

  describe '#upcoming_tasks' do
    subject { Scheduler::Schedule.upcoming_tasks[ScheduledUpdate][:tweet!] }

    it { should include upcoming_update }
    it { should_not include due_update }
    it { should_not include performed_update }
  end

  describe '#performed_tasks' do
    subject { Scheduler::Schedule.performed_tasks[ScheduledUpdate][:tweet!] }

    it { should include performed_update }
    it { should_not include due_update }
    it { should_not include upcoming_update }
  end

  describe '#due_tasks' do
    subject { Scheduler::Schedule.due_tasks[ScheduledUpdate][:tweet!] }

    it { should include due_update }
    it { should_not include upcoming_update }
    it { should_not include performed_update }
  end
end
