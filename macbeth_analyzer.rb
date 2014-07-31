require 'open-uri'

class LinesKeeper

  attr_reader :url, :file_to_parse, :speechings

  def initialize(url)
    @url = url
  end

  def get_file
    @file_to_parse = open(url).read
  end

  def break_into_speechings
    @speechings = file_to_parse.split('SPEECH>')
  end

end

url = 'http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml'

macbeth = open(url).read
macbeth_speechings = macbeth.split('SPEECH>')
characters_and_lines = Hash.new(0)
speaker_name_start = '<SPEAKER>'
speaker_name_end = '</SPEAKER>'

macbeth_speechings.each do |speech|
  if speech.include?(speaker_name_start) && speech.include?(speaker_name_end)
    speaker = speech[/#{Regexp.escape(speaker_name_start)}(.*?)#{Regexp.escape(speaker_name_end)}/m,1]
    characters_and_lines[speaker.to_sym] += speech.scan("<LINE>").count
  end
end

characters_and_lines.each do |character,lines|
  name_parts = character.to_s.split(" ")
  name_parts_capitalized = []
  name_parts.each { |np| name_parts_capitalized << np.capitalize }
  character = name_parts_capitalized.join(" ")
  puts "#{character}: #{lines}"
end

total_lines = characters_and_lines.values.reduce {|sum, n| sum + n.to_i }
puts "Total lines: #{total_lines}"