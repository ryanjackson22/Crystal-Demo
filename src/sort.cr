macro current_time 
  Time.utc
end

alias SizeT = LibC::SizeT

lib CBinding
  fun qsort(base : Void*, nitems : SizeT, size : SizeT, compar : (Void*, Void*) -> Int32) : Void
end

def compare(a : Void*, b : Void*) : Int32 # compare function for qsort()
  a_ptr = a.as(Int32*)
  b_ptr = b.as(Int32*)

  if a_ptr.value < b_ptr.value
    -1    # first element is less than the second
  elsif a_ptr.value > b_ptr.value
    1     # first element is greater than the second
  else
    0     # elements are equal
  end
end

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
  merge_sort(arr, left, mid)
  merge_sort(arr, mid + 1, right)
  merge(arr, left, mid, right)
end

def time_sort(arr, sort : Proc = ->bubble_sort)
  start = current_time
  _ = sort.call(arr)
  finish = current_time
  return finish - start
end

random_numbers = Array(Int32).new(500000) { rand(1..100) }
random_numbers2 = random_numbers

# puts time_sort(random_numbers, ->bubble_sort(Array(Int32)))
puts time_sort(random_numbers, ->merge_sort(Array(Int32)))

start = current_time
CBinding.qsort(
  random_numbers2,
  random_numbers2.size,
  sizeof(Int32),
  ->(a : Void*, b : Void*) { compare(a, b) }
)
finish = current_time

puts finish - start