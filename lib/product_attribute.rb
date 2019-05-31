class ProductAttribute
 
  attr_accessor :id
  attr_accessor :product_id
  attr_accessor :attribute_id
  attr_accessor :attribute_value_id

  # constructor
  def initialize(id, product_id, attribute_id, attribute_value_id)
    @id = id
    @product_id = product_id
    @attribute_id = attribute_id
    @attribute_value_id = attribute_value_id
  end

  # check valid of data
  def valid?
    return true unless @id.nil? && @product_id.nil? && @attribute_id.nil? && @attribute_value_id.nil?
    false
  end

  # store itself into database
  def create!
    if valid?
      # store into database
      return self
    else
      return false
    end 
  end

  # class method: build product_attributes object from hash params
  def self.build(params)
    product_attribute = ProductAttribute.new(params)
    product_attribute if product_attributes.valid?
  end

  # class method: configure products
  def self.configure(products)
    

  end
end
