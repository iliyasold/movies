# lesson_2

file = ARGV[0] || 'movies.txt'

unless File.exists?(file)
  abort "Sorry, file #{file} not found."
end

puts file

directors = []
timing = []
countries = []

File.foreach(file) do |line|

  a = line.split('|')
  b = (((a[7].to_f - 8).round(2))*10).to_i
  puts "#{a[1]} #{"*" * b} #{}" if a[1].include?('Max')

# lesson_3

# Сохранение в хэш
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
  timing << movieslib[:timing]
  countries << movieslib[:country]
end

# Удаление дублей и сортировка режиссёров по фамилии в алфавитном порядке 
  array = [] 
  directors.each { |item| array << item.split.reverse.join(' ') } 
  puts array.sort.uniq

  # Количество фильмов, снятых не в США
  puts (countries.delete_if {|x| x == "USA" }).size

  

  # # Поиск пяти самых длинных фильмов
#   array2 = []
#   timing.each { |item| array2 << item[0..-5] }

#   array3 = []
#   array2.each { |item| array3 << item.to_i }	
#   puts array3.sort[-5..-1]

