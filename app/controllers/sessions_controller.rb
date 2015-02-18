class SessionsController < ApplicationController
  def create
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

  private

  def user
    @user ||= twitter_login.user
  end

  def twitter_login
    return @twitter_login if @twitter_login
    @twitter_login = TwitterLogin.find_by(uid: auth_hash["uid"])

    if @twitter_login.nil?
      @twitter_login = TwitterLogin.create_with_omniauth(auth_hash)
    end

    @twitter_login
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
