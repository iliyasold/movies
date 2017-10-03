# lesson_2

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

#lesson_3

directors = []

File.foreach(file) do |line|
	
  a = line.split('|')

  movieslib = { 
  	link: a[0], 
  	title: a[1], 
  	year: a[2], 
  	country: a[3], 
  	date: a[4], 
  	genre: a[5], 
  	timing: a[6], 
  	raiting: a[7], 
  	director: a[8], 
  	actors: a[9] 
  }

  directors << movieslib[:director]

end
  
  array = []

  directors.each do |item|
    array <<  item.split.reverse.join(' ').to_s
  end

  puts array.sort.uniq