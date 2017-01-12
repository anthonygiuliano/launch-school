class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0 # !> assigned but unused variable - quantity
  end
end

a = InvoiceEntry.new("test", 3)
a.update_quantity(2)
a # => #<InvoiceEntry:0x007fcc0a83d910 @quantity=3, @product_name="test">
