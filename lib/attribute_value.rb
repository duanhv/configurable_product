class AttributeValue
  attr_accessor :id
  attr_accessor :value
  attr_accessor :type
  attr_accessor :attribute_id
   
  def initialize(id, value, value_type, attribute_id)
    @id = id
    @value = value
    @value_type = value_type
    @attribute_id = attribute_id
  end

  def valid?
    return true unless @id.nil? && @value.nil? && @value_type.nil? && attribute_id.nil?
    false
  end

  def create!
    if valid?
      return self
    else
      return false
    end
  end
end
