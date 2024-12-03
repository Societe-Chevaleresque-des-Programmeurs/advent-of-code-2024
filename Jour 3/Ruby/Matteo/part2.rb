def read_file()
  interesting_lines = []
  regex = /mul\(\d+,\d+\)/
  regex_do = /do\(\)/
  regex_dont = /don't\(\)/
  File.open('input', 'r') do |f|
    f.each_line do |line|
      do_list = line.split(regex_do)
      do_list.each do |todo|
        scanned = todo.split(regex_dont)[0]
        if scanned
          matches_line = scanned.scan(regex)
          if matches_line
            matches_line.each do |match|
              puts match
              interesting_lines.push(match)
            end
          end
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