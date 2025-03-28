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

  left_array = arr[left, n1]
  right_array = arr[mid + 1, n2]

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

def merge_sort(arr : Array, left : Int32 = 0, right : Int32 = arr.size - 1)
  return if left >= right
  
  mid = left + (right - left) // 2
  # mid = arr.size // 2
  merge_sort(arr, left, mid)
  merge_sort(arr, mid + 1, right)
  merge(arr, left, mid, right)
end

def time_sort(arr, sort : Proc = ->bubble_sort)
  start = Time.utc
  _ = sort.call(arr)
  finish = Time.utc
  return finish - start
end

random_numbers = Array(Int32).new(500000) { rand(1...100) }
random_numbers2 = random_numbers

# puts time_sort(random_numbers, ->bubble_sort(Array(Int32)))
puts time_sort(random_numbers2, ->merge_sort(Array(Int32)))
