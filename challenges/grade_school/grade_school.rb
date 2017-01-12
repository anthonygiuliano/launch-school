class School
  def initialize
    @students = Hash.new { [] }
  end

  def add(name, grade)
    @students[grade] = @students[grade] << name
  end

  def grade(grade)
    @students[grade]
  end

  def to_h
    @students.values.map(&:sort!)
    @students.sort_by{|k,_| k}.to_h
  end
end
