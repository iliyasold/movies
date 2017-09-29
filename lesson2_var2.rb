file = "movies.txt"
puts file

File.foreach('movies.txt') do |line|

    a = line.split('|')
    b = (((a[7].to_f - 8).round(2))*10).to_i

      if a[1].include?('Max')
        puts "#{a[1]} #{"*" * b} #{}"
      end
end
