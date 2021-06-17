# todos_controller.rb
class TodosController < ApplicationController
  def index
    render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    todo = Todo.find(id).to_pleasant_string
    render plain: todo
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(todo_text: todo_text, due_date: due_date, completed: false)

    response_text = "Your new todo is created with id #{new_todo.id} \n \n #{Todo.find(new_todo.id).to_pleasant_string}"
    render plain: response_text
  end
end
