def bubble_sort(arr)
    (0...arr.size - 1).each do |n|
        swapped = false
        (0...arr.size - n - 1).each do |i|
            if arr[i] > arr[i + 1]
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                swapped = true
            end
        end
        break unless swapped
    end
    arr
end

def merge_sort(arr)
    return arr if arr.size <= 1
  
    mid = arr.size / 2
    left_half = arr.take(mid)
    right_half = arr.drop(mid)
  
    left_half = merge_sort(left_half)
    right_half = merge_sort(right_half)
  
    merge(left_half, right_half)
  end
  
  def merge(left, right)
    result = []
    until left.empty? || right.empty?
      if left.first <= right.first
        result << left.shift
      else
        result << right.shift
      end
    end
    result.concat(left).concat(right)
  end

def time_sort(arr)
    start = Time.now()
    _ = bubble_sort(arr)
    finish = Time.now()
    finish - start
end
  
puts time_sort(1000.times.map { rand(-128..127)})