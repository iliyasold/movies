file = ARGV[0]

unless ARGV[0]
	file = 'movies.txt'	
end

unless (File.exists?(file))
	puts "Sorry, file #{file} not found."
	abort
end

puts file

File.foreach('movies.txt') do |line|

    a = line.split('|')
    b = (((a[7].to_f - 8).round(2))*10).to_i

      if a[1].include?('Max')
        puts "#{a[1]} #{"*" * b} #{}"
      end
end