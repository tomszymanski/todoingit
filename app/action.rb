require_relative 'listoftodos'
require_relative 'todo'
require_relative 'storage'

class Action
  @user_list_of_todos = ListOfTodos.new(Storage.load)

  def self.add(user_created_todo_item)
    user_todo = Todo.new(user_created_todo_item)
    @user_list_of_todos.add(user_todo)
    save_list_of_todos
  end

  def self.list
    @user_list_of_todos.list
  end

  def self.delete(user_todo_index)
    @user_list_of_todos.delete(user_todo_index)
    save_list_of_todos
  end

  def self.complete(user_todo_index)
    @user_list_of_todos.complete(user_todo_index)
    save_list_of_todos
  end

  def self.save_list_of_todos
    Storage.save(@user_list_of_todos.list)
  end

end