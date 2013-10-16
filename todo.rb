require 'csv'

class Todo
  attr_reader :description

  def initialize(description)
    @description = description
  end

end

class ListOfTodos
  def initialize
    @list_of_todos = []
  end

  def add(new_todo_item)
    @list_of_todos << new_todo_item
  end

  def delete(todo_index)
    @list_of_todos.delete_at(todo_index)
  end

  def show
    @list_of_todos
  end
end

class Storage
  STORAGE_FILE="todo.csv"

  def self.save(todo_list)
    CSV.open(STORAGE_FILE, "wb") do |csv|
        csv << todo_list
    end
  end

  def self.show
    storage_file_contents = []
    CSV.foreach(STORAGE_FILE) do |row|
      storage_file_contents << row
    end
    storage_file_contents
  end

end

class Action

  @user_list_of_todos = ListOfTodos.new

  def add(user_created_todo_item)
    user_todo = Todo.new
    user_todo(user_created_todo_item)
    @user_list_of_todos.add(user_todo)
    Storage.save(@user_list_of_todos.show)
  end

  def list
    @user_list_of_todos.show
  end

  def delete(user_todo_index)
    @user_list_of_todos.delete(user_todo_index)
    Storage.save(@user_list_of_todos.show)
  end

end












