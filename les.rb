
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
puts movies.map { |director| director.director }.uniq.sort_by{ |family| family.split(" ").last }

# Количество фильмов снятых не в США
puts "#{movies.count {|movie| movie.country.include?("USA") == false }} films are not made in the USA"

#Статистика: сколько и в каком месяце фильмов снято
num = 1
mounths = [
	nil,
	"январе", 
	"феврале", 
	"марте", 
	"апреле", 
	"мае", 
	"июне", 
	"июле", 
	"августе", 
	"сентябре", 
	"октябре", 
	"ноябре", 
	"декабре"  
]  

puts "Сколько и в каком месяце снято фильмов:"

while num <= 9 do
  puts "#{movies.count { |movie| movie.date.include?("-0#{num}-") == true }} в #{mounths[num]}"
  num += 1
end

num = 10
while num <= 12 do
  puts "#{movies.count { |movie| movie.date.include?("-#{num}-") == true }} в #{mounths[num]}"
  num += 1
end

#Сколько и в каком месяце фильмов снято (с помощью библиотеки date)
num = 1
mounths = [
	nil,
	"январе", 
	"феврале", 
	"марте", 
	"апреле", 
	"мае", 
	"июне", 
	"июле", 
	"августе", 
	"сентябре", 
	"октябре", 
	"ноябре", 
	"декабре"  
]  

puts "Сколько и в каком месяце снято фильмов:"

while num <= 12 do
  puts "#{movies.map { |movie| Date._strptime(movie[:date]) }.delete_if { |x| x == nil }.map { |item| item[:mon] }.count(num)} снято в #{mounths[num]}"
  num += 1
end