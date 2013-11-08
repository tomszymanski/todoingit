require 'minitest/unit'
require 'minitest/autorun'
require_relative '../app/todo'

class TestTodo < MiniTest::Unit::TestCase
  def setup
    @NEW_TODO_DESCRIPTION = "Bring Back That Loving Feeling"
    
    @todo = Todo.new(@NEW_TODO_DESCRIPTION)
  end
  def test_description
    assert_equal @NEW_TODO_DESCRIPTION, @todo.description
  end
end