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

  def self.filter(tag_to_filter_on = String.new,
                  list_of_todos_to_filter = Action.list)
    list_of_todos_to_filter.keep_if do |todo|
      todo.tag.any? do |tag|
        tag == tag_to_filter_on
      end
    end
    list_of_todos_to_filter
  end

  def self.list(list_ordering = String.new,
                tag_to_filter_on = String.new)
    list_of_todos_to_display = Action.list
    list_of_todos_to_display.each do |todo|
      todo.index = list_of_todos_to_display.index(todo)
    end
    unless tag_to_filter_on.empty?
      list_of_todos_to_display = filter(tag_to_filter_on)
    end
    unless list_ordering.nil? || list_ordering.empty?
      list_of_todos_to_display = sort(list_ordering)
    end
    puts list_of_todos_to_display
  end

  def self.sort(list_ordering,
                list_of_todos_to_sort = Action.list)
    sorted_list_of_todos = list_of_todos_to_sort.sort do |todo_a,todo_b|
      case list_ordering
      when 'outstanding'      
        todo_b.creation_date <=> todo_a.creation_date
      when 'completed'
        todo_b.completion_date <=> todo_a.completion_date
      end
    end
    sorted_list_of_todos
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