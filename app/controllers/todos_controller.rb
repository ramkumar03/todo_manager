# todos_controller.rb
class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    #todo = Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
    #render plain: Todo.show_list
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.find(id).to_pleasant_string
    render plain: "Todo Task id. #{id}\n\n #{todo}"
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(todo_text: todo_text, due_date: due_date, completed: false)

    #response_text = "Your new todo is created with id #{new_todo.id} \n \n #{Todo.find(new_todo.id).to_pleasant_string}"
    #render plain: response_text

    redirect_to todos_path
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    #render plain: "Todo Updated!!! \n #{todo.to_pleasant_string}"
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
