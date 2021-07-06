class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end

  #filters overdue todos
  def self.overdue
    where("due_date < ? and completed = ? ", Date.today, false).order(:due_date)
  end

  #filters today's todos
  def self.due_today
    where("due_date = ?", Date.today).order(:due_date)
  end

  #filters the due later todos
  def self.due_later
    where("due_date > ?", Date.today).order(:due_date)
  end

  # displays a formatted todo list
  def self.to_displayable_list
    all.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
  end

  def self.completed
    all.where(completed: true)
  end
  # Display full todo list
  def self.show_list
    "\n Todo-list:-
    \n\n Overdue:-\n
    #{overdue.to_displayable_list}
    \n\n Due Today:-\n\n
    #{due_today.to_displayable_list}
    \n\n Due Later:-\n
    #{due_later.to_displayable_list}
    \n\n"
  end

  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "\t |\t #{id}.\t|\t#{due_date.to_s(:short)}\t\t|\t#{todo_text} ------ #{is_completed}"
  end
end
