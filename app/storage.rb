require_relative 'todo'

class Storage
  STORAGE_FILE="config/todo.csv"

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