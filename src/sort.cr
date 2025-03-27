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
    return arr
  end

def merge(arr : Array, left : Int32, mid : Int32, right : Int32)
  n1 = mid - left + 1
  n2 = right - mid

  left_array = Array(Int32).new(n1) {0}
  right_array = Array(Int32).new(n2) {0}

  (0...n1).each do |i|
    left_array[i] = arr[left + i]
  end

  (0...n2).each do |j|
    right_array[j] = arr[mid + j + 1]
  end

  i = 0
  j = 0
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

def merge_sort(arr : Array, left : Int32 = 0, right : Int32 = arr.size - 1)
  return if left >= right 
  
  mid = left + (right - left) // 2
  merge_sort(arr, left, mid)
  merge_sort(arr, mid + 1, right)
  merge(arr, left, mid, right)
end

def time_sort(arr, sort : Proc)
  start = Time.utc
  _ = sort.call(arr)
  finish = Time.utc
  return finish - start
end

# puts time_sort(rand(StaticArray(Int8, 100)))
# arr = [1, 5, 2, 7, 3]
random_numbers = Array(Int32).new(10) { rand(1...100) }

puts random_numbers
puts merge_sort(random_numbers)
puts random_numbers


# puts arr.size
# merge_sort(arr, 0, arr.size - 1)
# proc = ->bubble_sort(Array(Int32))
# puts time_sort(arr, proc)