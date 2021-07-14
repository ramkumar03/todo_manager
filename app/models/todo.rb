class Todo < ActiveRecord::Base
  belongs_to :user

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

  def self.completed
    all.where(completed: true)
  end
end
