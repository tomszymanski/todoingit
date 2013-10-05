require 'csv'

FLAT_FILE="todo.csv"

def add(new_todo_item)
  CSV.open(FLAT_FILE, "w") do |csv|
    csv << [new_todo_item]
  end
end

def list
  list_num = 0
  CSV.foreach(FLAT_FILE) do |row|
    list_num += 1
    puts "#{list_num}. #{row}"
  end
end