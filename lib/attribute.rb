class Attribute
  attr_accessor :id
  attr_accessor :name
   
  def initialize(id, name)
    @id = id
    @name = name
  end

  def valid?
    return true unless id.nil? && name.nil?
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
