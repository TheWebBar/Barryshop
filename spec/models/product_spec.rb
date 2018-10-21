require 'rails_helper'

describe Product do
  let(:product) { FactoryBot.create(:product) }

  let(:user) { FactoryBot.create(:user)}


  before do
    product.comments.create!(rating: 1, user: user, body:"Awful bike!")
    product.comments.create!(rating: 3, user: user, body:"OK bike!")
    product.comments.create!(rating: 5, user: user, body:"Great bike!")
  end

  it "returns the average rating of all comments" do
    expect(product.average_rating).to eq 3
  end

  it "is not valid without a name" do
    expect(Product.new(description: "Nice bike")).not_to be_valid
  end

  it "is not valid without a description" do
    expect(Product.new(name: "Race bike")).not_to be_valid
  end

  it "is not valid without a image_url" do
    expect(Product.new(name: "Race bike")).not_to be_valid
  end

  it "is not valid without a colour" do
    expect(Product.new(name: "Race bike")).not_to be_valid
  end

  it "is not valid without a price" do
    expect(Product.new(name: "Race bike")).not_to be_valid
  end
end
