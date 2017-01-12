class SomePrivate
  def initialize
    method1
    # self.method1
  end

  private

    def method1
      puts "private method1 called"
    end
end

s = SomePrivate.new
# s.method1
