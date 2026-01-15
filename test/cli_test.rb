# frozen_string_literal: true

require "test_helper"
require "stringio"

class CLITest < Minitest::Test
  def test_shows_usage_with_no_args
    cli = Mk::CLI.new
    assert_output(/Usage: mk/) { assert_equal 1, cli.call([]) }
  end

  def test_shows_usage_with_one_arg
    cli = Mk::CLI.new
    assert_output(/Usage: mk/) { assert_equal 1, cli.call(["ruby"]) }
  end
end
