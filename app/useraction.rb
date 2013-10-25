require_relative 'action'

class UserAction

  def self.add(user_input_array)
    new_todo = ''

    user_input_array.each do |word|
      new_todo << word + ' '
    end

    Action.add(new_todo.rstrip)

    list
  end

  def self.list
    list_of_todos = Action.list
    list_of_todos.each do |todo_object|
      display_num = list_of_todos.index(todo_object)+1

      puts "#{display_num}. #{todo_object.to_s}"
    end
  end

  def self.update(delete_or_complete,index)
    case delete_or_complete
      when 'delete' 
        Action.delete(index)
      when 'complete'
        Action.complete(index)
    end

    list  
  end

end