require_relative 'action'

class UserAction

  def self.add(array_of_strings_for_todo)
    new_todo = ''

    array_of_strings_for_todo.each do |word|
      new_todo << word + ' '
    end

    Action.add(new_todo.rstrip)

    list
  end

  def self.list(list_ordering=String.new)
    list_of_todos = Action.list
    display_list = ''

    sorted_list_of_todos = list_of_todos.sort do |todo_a,todo_b|
      case list_ordering
      when 'outstanding'      
        todo_b.creation_date <=> todo_a.creation_date
      when 'completed'
        todo_b.completion_date <=> todo_a.completion_date
      else
        list_of_todos.index(todo_a) <=> list_of_todos.index(todo_b)
      end
    end

    sorted_list_of_todos.each do |todo_object|
      display_num = list_of_todos.index(todo_object)+1
      display_list << "#{display_num}. #{todo_object.to_s}\n"
    end

    puts display_list

  end

  def self.tag(index,array_of_tags)
    Action.tag(index,array_of_tags)
    list
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