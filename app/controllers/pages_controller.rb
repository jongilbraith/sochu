class PagesController < ApplicationController

  def home
    if logged_in?
      @scheduled_updates = current_user.scheduled_updates.untweeted.order('due_at ASC')
      @tweets = current_user.tweets.order('tweets.timestamp DESC')
    else
      render 'pages/home_logged_out'
    end
  end

  def schedule
    @upcoming_tasks = scheduler_schedule.upcoming_tasks
    @performed_tasks = scheduler_schedule.performed_tasks.reverse
  end

  private

  def scheduler_schedule
    @scheduler_schedule ||= Scheduler::Schedule.new(1.week.ago, 1.week.from_now)
  end

end
