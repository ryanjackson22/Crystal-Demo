def sort_array(arr)
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


ary = [4, 8, 10, 7, 2, 3, 9]
puts ary.to_s
puts sort_array(ary).to_s
