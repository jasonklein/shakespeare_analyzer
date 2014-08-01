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

    it 'is initialized with an empty characters_and_lines hash' do
      lines_keeper.characters_and_lines.must_be_kind_of Hash
      lines_keeper.characters_and_lines.must_be_empty
    end

  end

  describe '#get_file' do
    it 'gets the file from the url' do
      lines_keeper.get_file
      lines_keeper.file_to_parse.must_be_kind_of String
    end
  end

  describe '#break_file_into_speechings' do
    it 'splits the file into an array' do
      lines_keeper.get_file
      lines_keeper.break_file_into_speechings
      lines_keeper.speechings.must_be_kind_of Array
    end
  end

  describe '#determine_characters_and_lines' do
    it 'fills the characters_and_lines hash' do
      lines_keeper.get_file
      lines_keeper.break_file_into_speechings
      lines_keeper.determine_characters_and_lines
      lines_keeper.characters_and_lines.wont_be_empty
    end
  end

  describe '#print_characters_and_lines' do
    it 'prints the characters and lines' do
      lines_keeper.get_file
      lines_keeper.break_file_into_speechings
      lines_keeper.determine_characters_and_lines
      lines_keeper.print_characters_and_lines
    end
  end
end