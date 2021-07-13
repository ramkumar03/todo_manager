class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "sessions/new"
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      render plain: "/"
    else
      render plain: "You have entered the wrong password!"
    end
  end
end
