class Cashier

=begin
    :type n: Integer
    :type discount: Integer
    :type products: Integer[]
    :type prices: Integer[]
=end
    def initialize(n, discount, products, prices)
        @n = n
        @discount = discount
        @product_prices = products.zip(prices).to_h
        @customer_count = 0
    end


=begin
    :type product: Integer[]
    :type amount: Integer[]
    :rtype: Float
=end
    def get_bill(product, amount)
        @customer_count += 1
        total_bill = 0.0
        product_quantities = product.zip(amount).to_h
        product_quantities.each do |key, val|
            total_bill += val * @product_prices[key]
        end

        if (@customer_count % @n).zero?
            total_bill *= (1.0 - @discount.to_f / 100.0)
        end

        total_bill
    end
end

# Your Cashier object will be instantiated and called as such:
# obj = Cashier.new(n, discount, products, prices)
# param_1 = obj.get_bill(product, amount)