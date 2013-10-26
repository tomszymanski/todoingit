class Todo
  attr_reader :description,:complete

  def initialize(description,complete_val = 'false')
    @description = description
    @complete = complete_val
  end

  def complete_me
    @complete = 'true'
  end

  def to_s
    case is_complete
    when 'true'
      complete_display = "X"
    when 'false'
      complete_display = " "
    end
    "[#{complete_display}] #{@description}"
  end

  def is_complete
    @complete == 'true' ? 'true' : 'false'
  end

end