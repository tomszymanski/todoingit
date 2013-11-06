class Todo
  attr_reader :description,
              :complete, 
              :creation_date, 
              :completion_date,
              :tag
  attr_accessor :index

  def initialize(description,
                complete = 'false',
                creation_date = Time.new,
                completion_date = Time.new(0),
                tag = [])
    @description = description
    @complete = complete
    @creation_date = creation_date
    @completion_date = completion_date
    @tag = tag
  end

  def complete_me
    @complete = 'true'
    @completion_date = Time.now
  end

  def display_complete
    case is_complete
    when 'true'
      complete_display = "X"
    when 'false'
      complete_display = " "
    end
    complete_display = "[#{complete_display}]"
  end

  def display_index
    @index = @index + 1
  end

  def display_tag
    tag_display = String.new
    @tag.each do |tag|
      tag_display << "##{tag} "
    end
    tag_display = "[#{tag_display.chomp(' ')}]"
  end

  def is_complete
    @complete == 'true' ? 'true' : 'false'
  end

  def tag_me(array_of_tags)
    @tag = array_of_tags
  end

  def to_s
    "#{display_index}. #{display_complete} #{@description} #{display_tag}"
  end

end