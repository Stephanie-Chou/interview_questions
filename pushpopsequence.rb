def pushpopsequence(pushed,popped)
  dummy = []

  until pushed.empty?
    if pushed.last == popped.last
      pushed.pop
      popped.pop
    else
      dummy.push(popped.pop) until pushed.last == popped.last
      until dummy.empty?
        return false if dummy.pop != pushed.pop
      end
    end
  end
  return true
end

# [bottom .. top]
pushed = [1,2,3,4,5]
popped = [1,2,3,5,4]

# p pushpopsequence(pushed, popped)

pushed = [1,2,3,4,5]
popped = [1,2,4,5,3]

p pushpopsequence(pushed, popped)
