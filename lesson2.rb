ARGV[0] ||= 'movies.txt'

unless File.exists?(ARGV[0])
  abort "Sorry, file #{ARGV[0]} not found."
end

puts ARGV[0]

File.foreach(ARGV[0]) do |line|
	
  a = line.split('|')
  b = (((a[7].to_f - 8).round(2))*10).to_i
	  
  if a[1] == nil
  	abort "Sorry, file #{ARGV[0]} doesn't have required data"
  else
    puts "#{a[1]} #{"*" * b} #{}" if a[1].include?('Max')
  end
end