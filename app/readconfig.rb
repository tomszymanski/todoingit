require 'yaml'

class ReadConfig
    attr_reader :storage_file

    def initialize
        storage = YAML.load_file('config/storage.yml')

        @storage_file = storage['storage']['path']
    end
end