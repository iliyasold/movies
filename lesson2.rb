
File.foreach('movies.txt') do |line|
  if line.include?('Max')
    a = line.split('|')
    b = (((a[7].to_f - 8).round(2))*10).to_i
      if a[1].include?('Max')
        puts "#{a[1]} #{"*" * b} #{File.basename('movies.txt')}"
      end
  end
end

