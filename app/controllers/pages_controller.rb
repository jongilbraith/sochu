class PagesController < ApplicationController

  def home
    render 'pages/home_logged_out' if !logged_in?
  end

end
