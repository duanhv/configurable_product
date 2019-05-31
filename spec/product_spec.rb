require "product"

describe Product do
  describe "#create" do
    context "with valid data" do
       let(:product1) { Product.new(1, "Iphone X 64Gb Black") }
       let(:product2) { Product.new(2, "Iphone X 128Gb Yellow") }
       it "should create successfully" do
         expect(product1.create!).to be_truthy
         expect(product2.create!).to be_truthy
       end
    end
  end

end
