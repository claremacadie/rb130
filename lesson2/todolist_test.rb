# todolist_test.rb

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end
  
  def test_size
    assert_equal(3, @list.size)
  end
  
  def test_first
    assert_equal(@todo1, @list.first)
  end
  
  def test_last
    assert_equal(@todo3, @list.last)
  end
  
  def test_shift
    # assert_equal(@todo1, @list.shift)
    # assert_equal(2, @list.size)
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
  
  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end
  
  def test_done?
    assert_equal(false, @list.done?)
    @todo1.done!
    assert_equal(false, @list.done?)
    @todo2.done!
    assert_equal(false, @list.done?)
    @todo3.done!
    assert_equal(true, @list.done?)
  end
  
  def test_TypeError
    assert_raises(TypeError) { @list.add("p") }
    assert_raises(TypeError) { @list.add(1) }
  end
  
  # def test_shovel
  #   @todo4 = Todo.new("New task")
  #   @list << @todo4
  #   assert_equal(@todo4, @list.last)
  #   @list.pop
  # end
  
  def test_shovel
    new_todo = Todo.new("Walk the dog")
    @list << new_todo
    @todos << new_todo
  
    assert_equal(@todos, @list.to_a)
  end
  
  def test_add
    new_todo = Todo.new("Feed the cat")
    @list.add(new_todo)
    @todos << new_todo
  
    assert_equal(@todos, @list.to_a)
  end
  
  def test_item_at
    assert_raises(IndexError) { @list.item_at(4) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end
  
  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(4) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
  end
  
  # def test_mark_undone_at
  #   assert_raises(IndexError) { @list.mark_undone_at(4) }
  #   @list.mark_undone_at(0)
  #   assert_equal(false, @todo1.done?)
  # end
  
  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @todo1.done!
    @todo2.done!
    @todo3.done!
  
    @list.mark_undone_at(1)
  
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end
  
  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end
  
  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(0)
    assert_equal(@todo2, @list.first)
  end
  
  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_2
    @todo1.done!
    
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_3
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
  
    @list.done!
    assert_equal(output, @list.to_s)
  end
  
  def test_each
    assert_equal(@list, @list.each { |item| item.done!})
    assert_equal(true, @todo1.done?)
  end
  
  def test_select
    @todo1.done!
    new_list = @list.select { |item| item.done? }
    
    refute_equal(new_list, @list)
    assert_equal([@todo1], new_list.to_a)
  end
  
  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title("Buy milk"))
  end
  
  def test_all_done
    @todo1.done!
    new_list = TodoList.new("Today's Todos")
    new_list.add(@todo1)
    assert_equal(new_list.to_a, @list.all_done.to_a)
  end
  
  def test_all_not_done
    @todo1.done!
    new_list = TodoList.new("Today's Todos")
    new_list.add(@todo2)
    new_list.add(@todo3)
    assert_equal(new_list.to_a, @list.all_not_done.to_a)
  end
  
  def test_mark_done
    @list.mark_done("Buy milk")
    assert_equal(true, @todo1.done?)
  end
  
  def test_mark_all_done
    @list.mark_all_done
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end
  
  def test_mark_all_undone
    @list.mark_all_done
    @list.mark_all_undone
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

end