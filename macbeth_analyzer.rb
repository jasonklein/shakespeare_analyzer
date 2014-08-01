require 'open-uri'

class LinesKeeper

  attr_reader :url, :file_to_parse, :speechings, :characters_and_lines

  def initialize(url)
    @url = url
    @characters_and_lines = Hash.new(0)
  end

  def get_file
    @file_to_parse = open(url).read
  end

  def break_file_into_speechings
    @speechings = file_to_parse.split('SPEECH>')
  end

  def determine_characters_and_lines
    speaker_name_start = '<SPEAKER>'
    speaker_name_end = '</SPEAKER>'

    speechings.each do |speech|
      if speech.include?(speaker_name_start) && speech.include?(speaker_name_end)
        speaker = speech[/#{Regexp.escape(speaker_name_start)}(.*?)#{Regexp.escape(speaker_name_end)}/m,1]
        characters_and_lines[speaker] += speech.scan("<LINE>").count
      end
    end
  end

  def print_characters_and_lines
    characters_and_lines.each do |character,lines|
      name_parts = character.split(" ")
      name_parts_capitalized = []
      name_parts.each { |np| name_parts_capitalized << np.capitalize }
      character = name_parts_capitalized.join(" ")
      puts "#{character}: #{lines}"
    end

    total_lines = characters_and_lines.values.reduce {|sum, n| sum + n.to_i }
    puts "Total lines: #{total_lines}"
  end

end

macbeth_analyzer = LinesKeeper.new('http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml')
macbeth_analyzer.get_file
macbeth_analyzer.break_file_into_speechings
macbeth_analyzer.determine_characters_and_lines
macbeth_analyzer.print_characters_and_lines