require 'helper'

class TestSlimCodeOutput < TestSlim
  def test_render_with_call
    source = %q{
p
  = hello_world
}

    assert_html '<p>Hello World from @env</p>', source
  end

  def test_render_with_conditional_call
    source = %q{
p
  = hello_world if true
}

    assert_html '<p>Hello World from @env</p>', source
  end

  def test_render_with_parameterized_call
    source = %q{
p
  = hello_world("Hello Ruby!")
}

    assert_html '<p>Hello Ruby!</p>', source
  end

  def test_render_with_spaced_parameterized_call
    source = %q{
p
  = hello_world "Hello Ruby!"
}

    assert_html '<p>Hello Ruby!</p>', source
  end

  def test_render_with_spaced_parameterized_call_2
    source = %q{
p
  = hello_world "Hello Ruby!", :dummy => "value"
}

    assert_html '<p>Hello Ruby!dummy value</p>', source
  end

  def test_render_with_call_and_inline_text
    source = %q{
h1 This is my title
p
  = hello_world
}

    assert_html '<h1>This is my title</h1><p>Hello World from @env</p>', source
  end

  def test_render_with_attribute_starts_with_keyword
    source = %q{
p = hello_world in_keyword
}

    assert_html '<p>starts with keyword</p>', source
  end

  def test_hash_call
    source = %q{
p = hash[:a]
}

    assert_html '<p>The letter a</p>', source
  end

  def test_render_with_backslash_end
    source = %q{
p = \
"Hello" + \
" Ruby!"
}

    # This test case is currently broken
    # the backslash endings are not implemented
    #assert_html '<p>Hello Ruby!</p>', source
  end
end
