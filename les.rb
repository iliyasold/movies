# lesson_2

file = ARGV[0] || 'movies.txt'

  unless File.exists?(file)
    abort "Sorry, file #{file} not found."
  end

    puts file

    movieslib = {}
    directors = [] 
    countries = []
    movies = []

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

    movies << movieslib

    directors << movieslib[:director] 
    countries << movieslib[:country]
  end
 
  # 5 самых длинных хронометражей
 
  movies.max_by(5) { |movie| movie[:timing].delete(" min").to_i }.each do |movie|
    puts "#{movie[:title]} - #{movie[:timing]}"
  end

  # 10 комедий вышедших раньше остальных


  # Удаление дублей и сортировка режиссёров по фамилии в алфавитном порядке 
	array = [] 
	directors.each { |director| array << director.split.reverse.join(' ') } 
	puts array.sort.uniq

  # Количество фильмов снятых не в США
    def print_block
  	  without_US = yield
  	  puts "#{without_US} films are not made in the USA"
    end

  	print_block { (countries.delete_if {|country| country == "USA" }).size }