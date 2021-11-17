# text_test.rb

require 'minitest/autorun'

require_relative 'text'

class TextTest < MiniTest::Test
  
  def setup
    @file = File.open("sample_text.txt", 'r')
    @text_data = @file.read
    @test_text = Text.new(@text_data)
  end
  
  def test_swap
    total_ae = @text_data.count('a') + @text_data.count('e')
    assert_equal(0, @test_text.swap('a', 'e').count('a'))
    assert_equal(total_ae, @test_text.swap('a', 'e').count('e'))
  end
  
  def test_word_count
    number_of_words = @text_data.split(' ').size
    assert_equal(number_of_words, @test_text.word_count)
  end
  
  def teardown
    @file.close
  end
end