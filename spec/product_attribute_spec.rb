require "product_attribute"
require "product"
require "attribute"
require "attribute_value"

describe ProductAttribute do
  describe ".create" do

    # attribute data for test
    let(:attr_names) {["sale_price", "market_price", "color", "storage", "description", "origin", "factory_date", "images", "default_image", "weight"] }
    let(:attr_value1) {[999, 1099, "Black", 64, "description1", true, Time.new(2018,1,1), ["a1.jpg", "a2.jpg", "a3.jpg"], "a1.jpg", 0.11] }
    let(:attr_value2) {[950, 1050, "Yellow", 128, "description2", true, Time.new(2018,2,2), ["b1.jpg", "b2.jpg", "b3.jpg"], "b1.jpg", 0.12] }

    # prepare attirbutes
    let(:attributes) do
      attr_names.each_with_index.map { |attr, index| Attribute.new(index, attr).create! }
    end

    # prepare attribute_value for product 1 and 2
    let(:attribute_value_1) do
      attr_names.each_with_index.map { |attr, index| AttributeValue.new(index, index, attr_value1[index], index).create! }
    end
    let(:attribute_value_2) do
      attr_names.each_with_index.map { |attr, index| AttributeValue.new(index + 10, index, attr_value2[index], index).create! }
    end

    # create products 
    let(:product1) { Product.new(1, "Iphone X 64Gb Black") }
    let(:product2) { Product.new(2, "Iphone X 128Gb Yellow") }

    # prepare product_attributes for product 1 and 2
    let(:product_attributes_1) do
      attribute_value_1.each_with_index.map { |attr_value, index| ProductAttribute.new(index, product1.id, attr_value.attribute_id, attr_value.id ).create! }
    end
    let(:product_attributes_2) do
      attribute_value_2.each_with_index.map { |attr_value, index| ProductAttribute.new(index, product2.id, attr_value.attribute_id, attr_value.id ).create! }
    end

    context "when data valid" do
      before do
        product1.product_attributes = product_attributes_1
        product2.product_attributes = product_attributes_2
      end
 
      let(:configurable_product) { Product.configure(3, "Iphone X", [product1, product2]) }
      subject { configurable_product.product_attributes.size }
      it { is_expected.to eq 20 } # configurable product has 20 attributes (combine product1 and product2)
    end
  end 
end
