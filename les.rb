# lesson_2

file = ARGV[0] || 'movies.txt'

  unless File.exists?(file)
    abort "Sorry, file #{file} not found."
  end

    puts file

    directors = [] 
    timing = []
    movieslib = {}
    countries = []
    # fivelongest
    tenfirst_arr = []

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
    
    fivelongest = {
    	title: a[1], 
    	timing: a[6]
    }
    
    tenfirst = {
    	title: a[1], 
    	genre: a[5], 
    	date: a[4]
    }

    tenfirst_arr << tenfirst.each { |item| }
end
  
  # 5 самых длинных фильмов 
  # :title & :timing

  # 10 комедий вышедших раньше остальных
    tenfirst_arr.each do |item|
      if item[:genre].include?("Comedy") # и первые 10 самых ранних дат
      	 puts "#{item[:title]} - #{item[:genre]} - #{item[:date]}"
      end
    end

  # Удаление дублей и сортировка режиссёров по фамилии в алфавитном порядке 
	array = [] 
	directors.each { |item| array << item.split.reverse.join(' ') } 
	puts array.sort.uniq

  # Количество фильмов снятых не в США
  def print_block
  	without_US = yield
  	puts "#{without_US} films are not made in the USA"
  end

  	print_block { (countries.delete_if {|x| x == "USA" }).size }