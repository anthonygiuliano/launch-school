class Base
  def initialize
    @name = "Base"
  end

  def show x=0, y=0
    p "Base class, x: #{x}, y: #{y}"
  end

  private

    def private_method
      puts "private method called"
    end

  protected

    def protected_method
      puts "protected method called"
    end

  public

    def get_name
      @name
    end
end

class Derived < Base
  def public_method
    private_method
    protected_method
  end

  def show x, y
    super
    super x
    super x, y
    super()
  end
end

d = Derived.new
d.public_method
puts d.get_name
d.show 3, 3
