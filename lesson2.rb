file = ARGV[0] || 'movies.txt'

unless File.exists?(file)
  abort "Sorry, file #{file} not found."
end

puts file

File.foreach(file) do |line|
	
  a = line.split('|')
  b = (((a[7].to_f - 8).round(2))*10).to_i

  puts "#{a[1]} #{"*" * b} #{}" if a[1].include?('Max')
end