class Todo
  attr_accessor :complete
  attr_reader :description

  def initialize(description,complete=0)
    @description = description
    @complete = complete
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

  def complete(todo_index)
    @list_of_todos[todo_index].complete = 1
  end
end

class Storage
  STORAGE_FILE="todo.csv"

  def self.save(todo_list)
    File.open(STORAGE_FILE, "wb") do |file|
      todo_list.each do |todo|
        file.puts todo.description + ',' + todo.complete.to_s
      end
    end
  end

  def self.load
    storage_file_contents = []
    File.open(STORAGE_FILE, "r").each_line do |todo_row|
      todo_array = todo_row.split(',')
      todo = Todo.new(todo_array[0],todo_array[1].chomp)
      storage_file_contents << todo
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

  def self.complete(user_todo_index)
    @user_list_of_todos.complete(user_todo_index)
    Storage.save(@user_list_of_todos.list)
  end

end

class UserAction

  def self.add
    ARGV.shift
    new_todo = ''
    ARGV.each do |word|
      new_todo << word + ' '
    end
    Action.add(new_todo.rstrip)
    description_of_last_added_todo = Action.list[-1].description

    puts "Appended \"#{description_of_last_added_todo}\" to your TODO list..."
  end

  def self.list
    list_of_todos = Action.list
    list_of_todos.each do |todo_object|
      display_num = list_of_todos.index(todo_object)+1

      case Integer(todo_object.complete)
        when 0
          complete_display = " "
        when 1
          complete_display = "X"
      end

      puts "#{display_num}. [#{complete_display}] #{todo_object.description}"
    end
  end

  def self.update(delete_or_complete,index)
    description = Action.list[index].description

    case delete_or_complete
      when 'delete' 
        Action.delete(index)
        display_string = 'Deleted'
        from_or_in = 'from'
      when 'complete'
        Action.complete(index)
        display_string = 'Completed'
        from_or_in = 'in'
    end

    puts "#{display_string} \"#{description}\" #{from_or_in} your TODO list..."    
  end

end

case ARGV[0]

  when /add/i
    UserAction.add

  when /list/i
    UserAction.list

  when /delete/i
    UserAction.update('delete',Integer(ARGV[1])-1)

  when /complete/i
    UserAction.update('complete',Integer(ARGV[1])-1)

end












