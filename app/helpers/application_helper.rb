module ApplicationHelper
  def self.heapify(arr_objects,idx,max)
    return if arr_objects.length < 1
    left=idx*2-1
    right=idx*2+2
    largest = idx
    largest = left if left < max and arr_objects[left] > arr_objects[idx]
    largest = right if right < max and arr_objects[right] > arr_objects[largest]
    swap!(arr_objects,idx,largest) unless largest == idx
    heapify(arr_objects,largest,max)
  end

  def self.sort_for_heap a
    n = a.length
    (n/2-1).downto(0) {|el| heapify(a,el,n)}
    (n-1).downto(1) do |el|
      swap!(a,0,el)
      heapify(a,0,i)
    end
  end

  # Swap elements x and y in array a (simple XOR swap)
  def self.swap!(a,x,y)
    a[x] = a[x] ^ a[y]
    a[y] = a[x] ^ a[y]
    a[x] = a[x] ^ a[y]
    a
  end
end
