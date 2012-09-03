# Delegate methods
#
# Example from: http://www.ruby-doc.org/stdlib-1.9.3/libdoc/forwardable/rdoc/Forwardable.html
#
require 'forwardable'

class MyQueue
  extend Forwardable

  attr_reader :queue

  def initialize
    @queue = []
  end

  # Delegate a method to another object
  delegate empty: :queue
  # You can delegate multiple methods to instance variable
  delegate [:push, :size] => :queue
  

end


if __FILE__ == $0

  require 'minitest/autorun'

  class TestMyQueue < MiniTest::Unit::TestCase
    def setup
      @queue = MyQueue.new
    end

    def test_delegate_push_method_exist
      assert @queue.respond_to?(:push)
    end

    def test_delegate_empty_method_exist
      assert @queue.respond_to?(:empty)
    end

    def test_push_method
      @queue.push 42
      @queue.push 30
      assert_equal 2, @queue.size
      assert_equal [42, 30], @queue.queue
    end
    
  end

end
