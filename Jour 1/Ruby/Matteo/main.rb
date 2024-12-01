# frozen_string_literal: true

def part1()
  diff = 0
  list_1 = []
  list_2 = []

  File.open('input', 'r') do |f|
    f.each_line do |line|
      list = line.split
      list_1.push(list[0].to_i)
      list_2.push(list[1].to_i)
    end
  end

  # Sort list1
  list_1 = list_1.sort
  # Sort list2
  list_2 = list_2.sort

  for i in 0..list_1.length
    diff += (list_1[i].to_i - list_2[i].to_i).abs()
  end

  puts diff
end

def part2()
  similarity = 0
  list_1 = []
  list_2 = []

  File.open('input', 'r') do |f|
    f.each_line do |line|
      list = line.split
      list_1.append(list[0].to_i)
      list_2.append(list[1].to_i)
    end
  end

  list_1.each do |i|
    similarity += i * list_2.count(i)
  end

  puts similarity
end

part1()
part2()