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

  def complete(todo_index)
    @list_of_todos[todo_index].complete = 1
  end
end