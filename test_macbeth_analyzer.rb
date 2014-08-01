require 'minitest/autorun'


require_relative 'macbeth_analyzer'

describe LinesKeeper do

  let(:lines_keeper) {LinesKeeper.new('http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml')}

  describe '.new' do
    it 'creates a LinesKeeper object' do
      lines_keeper.wont_be_nil
    end

    it 'is initialized with a url' do
      lines_keeper.url.must_equal 'http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml'
    end
  end

  describe '#get_file' do
    it 'gets the file from the url' do
      lines_keeper.get_file
      lines_keeper.file_to_parse.must_be_kind_of String
    end
  end
end

# attr_reader :lines_keeper

# def setup
#   @lines_keeper = LinesKeeper.new('http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml')
# end

# before do
#   @lines_keeper = LinesKeeper.new('http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml')
# end



# def test_url
#   lines_keeper.url.must_equal 'http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml'
# end

# def test_file_to_parse
#   lines_keeper.get_file
#   lines_keeper.file_to_parse.must_be_kind_of String
# end

# def test_break_into_speeching
#   lines_keeper.break_into_speechings
#   lines_keeper.speechings.must_be_kind_of Array
# end
