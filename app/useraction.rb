require_relative 'action'

class UserAction

  def self.add
    new_todo = ''

    ARGV.shift
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
      when 'complete'
        Action.complete(index)
    end

    puts "#{delete_or_complete.capitalize}d \"#{description}\" from your TODO list..."    
  end

end