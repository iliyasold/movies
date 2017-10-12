MOVIES_KEYS = %i[link title year country date genre timing raiting director actor]

movies = File.foreach("movies.txt").map do |line| 
  MOVIES_KEYS.zip(line.split('|')).to_h
end

# 5 самых длинных хронометражей
movies.max_by(5) { |movie| movie[:timing].delete(" min").to_i }.each do |movie|
  puts "#{movie[:title]} - #{movie[:timing]}"
end

# 10 комедий вышедших раньше остальных
movies.select { |movie|  movie[:genre].include?("Comedy")  }.min_by(10) { |movie| movie[:date] }.each do |movie|
  puts "#{movie[:title]} - #{movie[:date]} - #{movie[:genre]}"
end

# Удаление дублей и сортировка режиссёров по фамилии в алфавитном порядке не меняя их местами
puts movies.map { |director| director[:director] }.uniq.map { |director| director.split(" ") }.sort_by{ |family| family.last }.map { |director| director.join(' ') }

# Количество фильмов снятых не в США
puts "#{movies.count {|movie| movie[:country].include?("USA") == false }} films are not made in the USA"