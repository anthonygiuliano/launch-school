def times(int)
  i = 0
  while i < int
    yield(i)
    i += 1
  end
  int
end

times(5) do |num|
  puts num
end
