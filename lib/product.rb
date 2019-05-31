class Product
 
  attr_accessor :id
  attr_accessor :name

  attr_accessor :product_attributes

  # constructor
  def initialize(id, name)
    @id = id
    @name = name
  end
 
  # check valid of data
  def valid?
    return true unless id.nil? && name.nil?
    false
  end

  # store itself into database
  def create!
    if valid?
      return self
    else
      return false
    end 
  end

  # class method: build product object from hash params
  def self.build(params)
    product = Product.new(params[:id], params[:name])
    product 
  end

  # class method: create configurable product
  def self.configure(product_id, configurable_product_name, products)
    product_attrs = [] 
    products.each_with_index do |product, index1|
      product.product_attributes.each_with_index do |prod_attr, index2|
        product_attrs << ProductAttribute.new(100 * index1 + index2, product.id, prod_attr.attribute_id, prod_attr.attribute_value_id).create!
      end
    end
    prod = Product.new(product_id, configurable_product_name).create!
    prod.product_attributes = product_attrs
    prod
  end
end
