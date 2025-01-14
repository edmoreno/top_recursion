def fibs(value)
  case value
  when 0 then []
  when 1 then [0]
  when 2 then [0, 1]
  when 3 then [0, 1, 1]
  else
    array = [0, 1, 1]
    (value - 3).times do |i|
      array << array[-1] + array[-2]
    end
    array
  end
end

def fibs_rec(value)
  if value == 0
    []
  elsif value == 1
    fibs_rec(0).push(0)
  elsif value == 2
    fibs_rec(1).push(1)
  else
    array = fibs_rec(value - 1)
    array.push(array[-1] + array[-2])
    array
  end
end

def merge_sort(array)
  return array if array.size <= 1

  left, right = array.each_slice((array.size / 2.0).round).to_a
  # sort the left half
  left = merge_sort(left) if left.size > 1
  # sort the right half
  right = merge_sort(right) if right.size > 1
  # merge the two halves
  result_array = []
  while left.size.positive? && right.size.positive?
    result_array << if left[0] <= right[0]
                      left.shift
                    else
                      right.shift
                    end
  end
  left.size > right.size ? result_array.concat(left) : result_array.concat(right)
end