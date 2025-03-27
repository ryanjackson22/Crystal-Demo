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

def time_sort(arr, sort_method)
    start = Time.now
    _ = sort_method.call(arr)
    finish = Time.now
    finish - start
  end
  
  random_numbers = 1000000.times.map { rand(1...100) }
  random_numbers2 = random_numbers.dup
  
#   puts time_sort(random_numbers, method(:bubble_sort))
  puts time_sort(random_numbers2, method(:merge_sort))