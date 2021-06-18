# users_controller.rb
class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    user = User.order(:id).map { |user| user.to_display_user }.join("\n")
    render plain: "\n User List: - \n \n #{user}"
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(name: name, email: email, password: password)
    response_text = "hey #{new_user.name}, \n Your User id created with id #{new_user.id}"
    render plain: response_text
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.where("email = ? and password = ?", email, password).first
    response_text = user ? "true" : "false"
    render plain: response_text
  end
end
