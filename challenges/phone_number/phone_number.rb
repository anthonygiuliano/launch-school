class PhoneNumber
  def initialize(phone)
    @phone = phone.to_s
    @phone = "0" * 10 if invalid?
    @phone.gsub!(/\D/, '')
    @phone_array = @phone.scan(/\d/)
    trim!
  end

  def number
    @phone_array.join
  end

  def area_code
    @phone_array[0..2].join
  end

  def to_s
    @phone_array.insert(6, '-').insert(3, ') ').insert(0, '(').join
  end

  private

  def trim!
    if @phone_array.first == '1' && @phone_array.length == 11
      @phone_array.shift
      @phone = @phone_array.join
    end
  end

  def invalid?
    return true if @phone.match(/[a-zA-Z]/)
    phone = @phone.gsub(/\D/, '')
    phone.length < 10 || (phone.length == 11 && phone.chars.first != '1') || phone.length > 11
  end
end
