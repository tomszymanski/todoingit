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

case ARGV[0]

  when /add/i
    ARGV.shift
    new_todo = ''
    ARGV.each do |word|
      new_todo << word + ' '
    end
    Action.add(new_todo.rstrip)
    description_of_last_added_todo = Action.list[-1].description

    puts "Appended \"#{description_of_last_added_todo}\" to your TODO list..."

  when /list/i
    list_of_todos = Action.list
    list_of_todos.each do |todo_object|
      display_num = list_of_todos.index(todo_object)+1
      puts "#{display_num}. #{todo_object.description}"
    end

  when /delete/i
    todo_to_delete = Integer(ARGV[1]) -1
    description_of_todo_to_delete = Action.list[todo_to_delete].description

    Action.delete(todo_to_delete)

    puts "Deleted \"#{description_of_todo_to_delete}\" from your TODO list..."

end












