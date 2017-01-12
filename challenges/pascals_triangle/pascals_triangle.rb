class Triangle
  def initialize(rows)
    @rows = rows
    @triangle = Array.new(@rows) do |i|
      Array.new(i + 1) { 0 }
    end
  end

  def rows
    (1..@rows).each { |i| fill_row(i) }
    @triangle
  end

  def fill_row(row_num)
    cur_row = row_num - 1
    prev_row = row_num - 2
    row_num.times do |i|
      if i == 0 || i == cur_row
        @triangle[cur_row][i] = 1
      else
        @triangle[cur_row][i] = @triangle[prev_row][i] + @triangle[prev_row][i - 1]
      end
    end
  end
end
