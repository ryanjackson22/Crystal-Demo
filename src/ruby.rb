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

def time_sort(arr)
    start = Time.now()
    _ = bubble_sort(arr)
    finish = Time.now()
    finish - start
end
  
puts time_sort(1000.times.map { rand(-128..127)})