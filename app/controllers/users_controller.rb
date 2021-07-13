# users_controller.rb
class UsersController < ApplicationController
  def index
    user = User.order(:id).map { |user| user.to_display_user }.join("\n")
    render plain: "\n User List: - \n \n #{user}"
  end

  def new
    render "users/new"
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]

    User.create!(first_name: first_name, last_name: last_name, email: email, password: password)

    redirect_to "/"
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.where("email = ? and password = ?", email, password).first
    response_text = user ? "true" : "false"
    render plain: response_text
  end
end
