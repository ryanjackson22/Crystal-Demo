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

# def merge_sort(arr)
#     return arr if arr.size <= 1
  
#     mid = arr.size / 2
#     left_half = arr.take(mid)
#     right_half = arr.drop(mid)
  
#     left_half = merge_sort(left_half)
#     right_half = merge_sort(right_half)
  
#     merge(left_half, right_half)
#   end
  
#   def merge(left, right)
#     result = []
#     until left.empty? || right.empty?
#       if left.first <= right.first
#         result << left.shift
#       else
#         result << right.shift
#       end
#     end
#     result.concat(left).concat(right)
#   end

def merge(arr, left, mid, right)
    n1 = mid - left + 1
    n2 = right - mid
  
    left_array = arr[left, n1]
    right_array = arr[mid + 1, n2 + 1]
  
    i = j = 0
    k = left
  
    while i < n1 && j < n2
      if left_array[i] <= right_array[j]
        arr[k] = left_array[i]
        i += 1
      else
        arr[k] = right_array[j]
        j += 1
      end
      k += 1
    end
  
    while i < n1
      arr[k] = left_array[i]
      i += 1
      k += 1
    end
  
    while j < n2
      arr[k] = right_array[j]
      j += 1
      k += 1
    end
  end
  
  def merge_sort(arr, left = 0, right = arr.size - 1)
    return if left >= right
  
    mid = left + (right - left) / 2
    merge_sort(arr, left, mid)
    merge_sort(arr, mid + 1, right)
    merge(arr, left, mid, right)
  end

def time_sort(arr, sort_method)
    start = Time.now
    _ = sort_method.call(arr)
    finish = Time.now
    finish - start
  end
  
  random_numbers = 500000.times.map { rand(1...100) }
  random_numbers2 = random_numbers.dup
  
#   puts time_sort(random_numbers, method(:bubble_sort))
  puts time_sort(random_numbers2, method(:merge_sort))