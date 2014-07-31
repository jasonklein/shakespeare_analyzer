require 'minitest/autorun'
require_relative 'lines_keeper'

class LinesKeeperTest < MiniTest::Unit::TestCase

  attr_reader :lines_keeper

  def setup
    @lines_keeper = LinesKeeper.new
  end

  def test_get_file
    assert_must_be_kind_of String, lines_keeper.file_to_parse
  end
end