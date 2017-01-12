def uuid
  uuid = []
  32.times do |i|
    uuid << rand(15).to_s(16)
    case i
    when 7
      uuid << "-"
    when 11
      uuid << "-"
    when 15
      uuid << "-"
    when 19
      uuid << "-"
    end
  end
  uuid.join
end

p uuid