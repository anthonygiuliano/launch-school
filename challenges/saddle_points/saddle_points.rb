class Matrix
  attr_accessor :matrix, :length

  def initialize(matrix)
    @matrix = matrix.split("\n").map { |row| row.split(" ").map!(&:to_i) }
  end

  def rows
    @matrix
  end

  def columns
    columns = []
    rows.first.length.times do |i|
      columns << @matrix.map { |row| row[i] }
    end
    columns
  end

  def saddle_points
    possible_points = (0...rows.length).to_a.product((0...columns.length).to_a)
    possible_points.select { |arr| saddle_point?(arr.first, arr.last) }
  end

  def saddle_point?(y, x)
    value = value_at(y, x)
    row_max = rows[y].max
    col_min = columns[x].min
    return true if value == row_max && value == col_min
    return false
  end

  def value_at(y, x)
    rows[y][x]
  end
end
