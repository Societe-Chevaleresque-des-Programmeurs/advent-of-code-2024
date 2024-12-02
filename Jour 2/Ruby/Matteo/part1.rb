def sorted?(arr=[], index=0, ascending=true)
  return true if arr.empty? || index == arr.length - 1

  if ascending
    return false if arr[index].to_i >= arr[index + 1].to_i
  else
    return false if arr[index].to_i <= arr[index + 1].to_i
  end

  sorted?(arr, index + 1, ascending)
end

def read_file()
  top_list = []
  File.open('input', 'r') do |f|
    f.each_line do |line|
      list = line.split(" ").map(&:to_i)
      top_list.append(list)
    end
  end

  return top_list
end

def check_report(report)
  size = report.length
  if sorted?(report, 0, report[0] < report[1])
    if report.uniq.length == size
      cond_diff = true
      for i in 1...(report.length) do
        diff = (report[i].to_i - report[i-1].to_i).abs
        if (diff < 1) || (diff > 3)
          cond_diff = false
        end
      end
      return cond_diff
    end
  end

  return false
end

def main()
  count = 0
  list = read_file()
  list.each do |report|
    if check_report(report)
      count += 1
    end
  end

  return count
end

puts main()