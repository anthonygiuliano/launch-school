class Trinary
  attr_accessor :value

  def initialize(value)
    @value = value.to_s
    @value = 0 unless valid_trinary?
  end

  def to_decimal
    return 0 if @value == 0
    @value.split("").reverse.map.with_index do |v, i|
      v.to_i * 3 ** i
    end.inject(:+)
  end

  private

    def valid_trinary?
      @value.match(/^[0-2]+$/)
    end

end
