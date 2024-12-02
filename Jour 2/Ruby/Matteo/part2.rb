def sorted?(arr=[], ascending=true)
  return true if arr.empty? || arr.length == 1

  (0...arr.length - 1).each do |i|
    if ascending
      return false if arr[i] >= arr[i + 1]
    else
      return false if arr[i] <= arr[i + 1]
    end
  end

  true
end

def read_file()
  top_list = []
  File.open('input', 'r') do |f|
    f.each_line do |line|
      list = line.split(" ").map(&:to_i)
      top_list.append(list)
    end
  end

  top_list
end

def check_report(report)
  size = report.length
  ascending = report[0] < report[1]

  if sorted?(report, ascending)
    if report.uniq.length == size
      cond_diff = true
      (1...report.length).each do |i|
        diff = (report[i] - report[i - 1]).abs
        if diff < 1 || diff > 3
          cond_diff = false
          break
        end
      end
      return cond_diff
    end
  end

  (0...report.length).each do |to_delete|
    copied_report = report.dup
    copied_report.delete_at(to_delete)
    if sorted?(copied_report, copied_report[0] < copied_report[1])
      if copied_report.uniq.length == size - 1
        cond_diff = true
        (1...copied_report.length).each do |i|
          diff = (copied_report[i] - copied_report[i - 1]).abs
          if diff < 1 || diff > 3
            cond_diff = false
            break
          end
        end
        return cond_diff
      end
    end
  end

  false
end

def main()
  count = 0
  list = read_file()
  list.each do |report|
    count += 1 if check_report(report)
  end

  count
end

puts main()