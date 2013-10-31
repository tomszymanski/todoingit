require_relative 'todo'
require_relative 'readconfig'
require 'yaml/store'

class Storage
  @config = ReadConfig.new

  def self.save(todo_list)
    store = YAML::Store.new @config.storage_file

    store.transaction do
      store['todos'] = todo_list
    end
  end

  def self.load
    storage_file_contents = []

    hash_of_todos = YAML.load_file(@config.storage_file)
    hash_of_todos['todos'].each do |todo|
      storage_file_contents << Todo.new(todo.description,
                                        todo.complete,
                                        todo.creation_date,
                                        todo.completion_date,
                                        todo.tag)
    end
    storage_file_contents

  end

end