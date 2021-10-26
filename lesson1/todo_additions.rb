# todo_additions.rb

# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    @todos << todo
  end
  alias_method :add, :<<

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each_index do |idx|
      mark_done_at(idx)
    end
  end

  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    @todos.clone	# returns the `array` parameter, similar in spirit to how `Array#each` returns the caller
  end
  
	def each
		@todos.each do |todo|
			yield(todo)
		end
		self
	end
	
	def select
		new_todolist = TodoList.new(title)
		
		each do |todo|
			new_todolist << todo if yield(todo)
		end
		
		new_todolist
	end
	
	def find_by_title(str)
	  each do |todo|
	    return todo if todo.title == str
	  end
	  nil
	end
	
	def all_done
	  select do |todo|
	    todo.done?
	  end
	end
	
	def all_not_done
	  select do |todo|
	    !todo.done?
	  end
	end
	
	def mark_done(str)
	  each do |todo|
	    todo.done! if todo.title == str
	  end
	end
	
	def mark_all_done
	  each do |todo|
	    todo.done!
	  end
	end
	
	def mark_all_undone
	  each do |todo|
	    todo.undone!
	  end
	end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

puts list
list.mark_all_undone
puts list

# p list.find_by_title("Buy milk")
# p list.find_by_title("milk")

# list.each do |todo|
#   puts todo                   # calls Todo#to_s
# end


# results = list.select { |todo| todo.done? }    # you need to implement this method

# puts results.inspect