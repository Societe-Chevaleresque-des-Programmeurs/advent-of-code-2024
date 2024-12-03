def read_file()
  interesting_lines = []
  regex = /mul\(\d+,\d+\)/
  File.open('input', 'r') do |f|
    f.each_line do |line|
      matches_line = line.scan(regex)
      if matches_line
        matches_line.each do |match|
          interesting_lines.push(match)
        end
      end
    end
  end
  return interesting_lines
end

def main()
  lines = read_file
  sum = 0
  mul_regex = /mul\((\d+),(\d+)\)/
  lines.each do |line|
    numbers = line.match(mul_regex).captures
    sum += numbers[0].to_i * numbers[1].to_i
  end

  puts sum
end

main