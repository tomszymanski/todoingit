require 'csv'

class Todo
  attr_reader :description

  def initialize(description)
    @description = description
  end

end

class ListOfTodos
  def initialize(storage_list_of_todos)
    @list_of_todos = storage_list_of_todos
  end

  def add(new_todo_item)
    @list_of_todos << new_todo_item
  end

  def delete(todo_index)
    @list_of_todos.delete_at(todo_index)
  end

  def list
    @list_of_todos
  end
end

class Storage
  STORAGE_FILE="todo.csv"

  def self.save(todo_list)
    File.open(STORAGE_FILE, "wb") do |csv|
      todo_list.each do |todo|
        csv << todo.description + ','
      end
    end
  end

  def self.load
    storage_file_contents = []
    File.open(STORAGE_FILE, "r").each_line do |list_of_todos|
      list_of_todos.split(',').each do |todo_description|
        todo = Todo.new(todo_description)
        storage_file_contents << todo
      end
    end
    storage_file_contents
  end

end

class Action
  @user_list_of_todos = ListOfTodos.new(Storage.load)

  def self.add(user_created_todo_item)
    user_todo = Todo.new(user_created_todo_item)
    @user_list_of_todos.add(user_todo)
    Storage.save(@user_list_of_todos.list)
  end

  def self.list
    @user_list_of_todos.list
  end

  def self.delete(user_todo_index)
    @user_list_of_todos.delete(user_todo_index)
    Storage.save(@user_list_of_todos.list)
  end

end












