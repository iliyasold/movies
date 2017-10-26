
require 'csv'
require 'ostruct'
require 'date'

MOVIES_KEYS = %i[link title year country date genre timing raiting director actor]

def cool_view(movie)
  puts "#{movie[:title]} (#{movie[:date]}; #{movie[:genre]}) - #{movie[:timing]}"
end

# Создание библиотеки фильмов из файла movies.txt
movies = CSV.read('movies.txt', headers: MOVIES_KEYS, col_sep: '|').map { |line| OpenStruct.new(line.to_h) }

# 5 самых длинных хронометражей
movies.max_by(5) { |movie| movie.timing.delete(" min").to_i }.each { |movie| cool_view(movie) }

# 10 комедий вышедших раньше остальных
movies.select { |movie| movie.genre.include?("Comedy")  }.min_by(10) { |movie| movie[:date] }.each do |movie|
  cool_view(movie)
end

# Удаление дублей и сортировка режиссёров по фамилии в алфавитном порядке не меняя их местами
puts movies.map(&:director).uniq.sort_by { |family| family.split(" ").last }

# Количество фильмов снятых не в США
puts "#{movies.count {|movie| !movie.country.include?("USA") }} films are not made in the USA"

#Статистика: сколько и в каком месяце фильмов снято
puts "Сколько и в каком месяце снято фильмов:"
MOUNTHS_KEYS = [nil, "в январе", "в феврале", "в марте", "в апреле", "в мае", "в июне", "в июле", "в августе", "в сентябре", "в октябре", "в ноябре", "в декабре"] 

hash = Hash.new(0)
mounths = movies.map { |movie| Date._strptime(movie.date, '%Y-%m') }.compact.map { |item| item[:mon] }.sort.each_with_object(MOUNTHS_KEYS) { |elem| hash[elem] += 1 }
puts hash