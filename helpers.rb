def my_pluralize(num, singular, plural = nil)
  if num == 1
    singular
  elsif plural
    plural
  else
    singular + 's'
  end
end

def joinor(arr, delim = ', ', conj = 'or')
  arr[-1] = "#{conj} #{arr.last}" if arr.length > 1
  arr.join(delim)
end
