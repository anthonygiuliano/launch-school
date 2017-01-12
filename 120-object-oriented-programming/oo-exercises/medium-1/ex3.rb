class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

# attr_accessor would still need a change to update_quantity method
# as is, quantity is being created as a new local variable, not referencing
# an existing instance variable. @ or self would still be needed.s
