class Todo
  attr_accessor :complete
  attr_reader :description

  def initialize(description,complete=0)
    @description = description
    @complete = complete
  end

end