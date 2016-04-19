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
    @upcoming_tasks = Scheduler::Schedule.upcoming_tasks
    @performed_tasks = Scheduler::Schedule.performed_tasks.reverse
  end

end
