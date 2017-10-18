
MOVIES_KEYS = %i[link title year country date genre timing raiting director actor]

def cool_view(movie)
  puts "#{movie[:title]} (#{movie[:date]}; #{movie[:genre]}) - #{movie[:timing]}"
end

# Создание библиотеки фильмов из файла movies.txt
movies = File.foreach("movies.txt").map { |line| MOVIES_KEYS.zip(line.split('|')).to_h }

# 5 самых длинных хронометражей
movies.max_by(5) { |movie| movie[:timing].delete(" min").to_i }.each { |movie| cool_view(movie) }

# 10 комедий вышедших раньше остальных
movies.select { |movie| movie[:genre].include?("Comedy")  }.min_by(10) { |movie| movie[:date] }.each do |movie|
  cool_view(movie)
end

# Удаление дублей и сортировка режиссёров по фамилии в алфавитном порядке не меняя их местами
puts movies.map { |director| director[:director] }.uniq.sort_by{ |family| family.split(" ").last }

# Количество фильмов снятых не в США
puts "#{movies.count {|movie| movie[:country].include?("USA") == false }} films are not made in the USA"