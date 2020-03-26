class ShoppingCart
  attr_reader :name, :capacity, :products

  def initialize(name_parameter, capacity_parameter)
    @name = name_parameter
    @capacity = capacity_parameter.delete('items').to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products
    total = 0

    @products.each do |product|
      total += product.quantity
    end

    total

    # @products.sum {|product| product.quantity}
  end

  def is_full?
    # if total_number_of_products > @capacity
    #   true
    # else
    #   false
    # end

    total_number_of_products > @capacity
  end

  def products_by_category(category)
    # category_products = []
    #
    # @products.each do |product|
    #   if product.category == category
    #     category_products << product
    #   end
    # end
    #
    # category_products

    @products.find_all {|product| product.category == category}
  end

  def details
    info = Hash.new
    info[:name] = @name
    info[:capacity] = @capacity
    info

    # {name: @name, capacity: @capacity}
  end

  def percentage_occupied
    ((total_number_of_products.to_f / @capacity) * 100).round(2)
  end

  def sorted_products_by_quantity
    @products.sort_by {|product| product.quantity}.reverse
  end

  def product_breakdown
    details = {}

    @products.each do |product|
      require "pry"; binding.pry
      details[product.category] = products_by_category(product.category)
    end

    details
  end

end
