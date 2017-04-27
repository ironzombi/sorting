class Sort
##########################
#   Bubble Sort Method   #
##########################
  def bubble(num)
    i = 0
    while i < num.size
      j = num.size - 1
      while i < j
        if num[j] < num[j - 1]
          temp = num[j]
          num[j] = num[j - 1]
          num[j - 1] = temp
        end
        j = j-=1
      end
      i +=1
    end
    return num
  end
########################
# Insert Sort Method   #
########################
  def insert(num)
    num.each_index do |x|
      min_index = min(num,x)
      num[x], num[min_index] = num[min_index], num[x]
    end
    return num
  end

  def min(subset, from)
    min_value = subset[from..-1].min
    min_index = subset[from..-1].index(min_value) + from
    return min_index
  end
#########################
#  Shell Sort Method    #
#########################
  def shell(num)
    i = 0
    j = 0
    size = num.length
    increment = size / 2
    temp = 0
    while increment > 0
      i = increment
      while i < size
        j = i
        temp = num[i]
        while j >= increment and num[j - increment] > temp
          num[j] = num[j - increment]
          j = j - increment
        end
        i +=1
        num[j] = temp
      end
      if increment == 3
        increment = 2
      else 
        increment = (increment/2).to_i
      end
    end
    return num
  end
#######################
# private methods     #
#######################
  private :min
end

