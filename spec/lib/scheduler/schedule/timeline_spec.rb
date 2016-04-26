require_relative '../../../rails_helper'

RSpec.describe Scheduler::Schedule::Timeline do
  let(:due_task) { create(:task, due_at: 1.minute.ago) }
  let(:upcoming_task) { create(:task, due_at: 1.minute.from_now) }
  let(:performed_task) { create(:task, due_at: 1.minute.ago, performed_at: 1.minute.ago) }

  let(:timeline) { described_class.new }

  before do
    timeline.tasks << due_task
    timeline.tasks << upcoming_task
    timeline.tasks << performed_task
  end

  describe '#upcoming_tasks' do
    subject { timeline.send(:upcoming_tasks) }

    it { should include upcoming_task }
    it { should_not include due_task }
    it { should_not include performed_task }
  end

  describe '#performed_tasks' do
    subject { timeline.send(:performed_tasks) }

    it { should include performed_task }
    it { should_not include due_task }
    it { should_not include upcoming_task }
  end

  describe '#due_tasks' do
    subject { timeline.send(:due_tasks) }

    it { should include due_task }
    it { should_not include upcoming_task }
    it { should_not include performed_task }
  end
end
