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
    @upcoming_tasks = Scheduler::Schedule.new.upcoming_tasks
    @performed_tasks = Scheduler::Schedule.new.performed_tasks.reverse
  end

end
