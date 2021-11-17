# easy_testing_exercises.rb

# # 1. Boolean assertions

# def test_odd?
#   assert_equal(true, value.odd?)
# end


# # 2. Equality assertions

# def test_downcase
#   assert_equal('xyz', value.downcase)
# end


# # 3. Nil assertions

# def test_value
#   # assert_equal(nil, value)
#   assert_nil(value) # this is a better solution as it provides a better failure message
# end


# # 4. Empty object assertions

# def test_list
#   assert_empty list
# end


# # 5. Included object assertions

# def test_list
#   assert_includes(list, 'xyz')
# end


# # 6. Excepted assertions

# def test_hire
#   assert_raises(NoExperienceError) { employee.hire }
# end


# # 7. Type assertions

# def test_value
#   assert_instance_of(Numeric, value)
# end


# # 8. Kind assertions

# def test_value
#   assert_kind_of(Numeric, value)
# end


# # 9. Same object assertions

# def test_list
#   assert_same (list, list.process)
# end


# # 10. Refutations

# def test_list
#   refute_includes(list, 'xyz')
# end
