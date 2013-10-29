class Todo
  attr_reader :description,
              :complete, 
              :creation_date, 
              :completion_date

  def initialize(description,
                complete_val = 'false',
                creation_date = Time.new,
                completion_date = Time.new(0))
    @description = description
    @complete = complete_val
    @creation_date = creation_date
    @completion_date = completion_date
  end

  def complete_me
    @complete = 'true'
    @completion_date = Time.now
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