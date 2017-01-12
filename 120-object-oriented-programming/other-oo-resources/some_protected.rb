class SomeProtected
  def initialize
    method1
    self.method1
  end

  protected

    def method1
      puts "protected method1 called"
    end
end

s = SomeProtected.new
# s.method1
