require 'rails_helper'
RSpec.describe User, type: :model do

  before do
    @user = User.create(first_name: "Tapioca", last_name:"Juice", email: "Tapioca@gmail.com", password: "hello")
  end

 subject(:user) { FactoryGirl.create(:user)}
  
  it "has first name" do
    expect(user.first_name).not_to be_empty
  end
  
  it "has a last name" do
    expect(user.last_name).not_to be_empty
  end
  
  it "has an email and it is unique" do
    expect(user.email).to eq(user.email)
    expect(user.email).not_to be_empty
  end
  
  it "has a location listed" do
    expect(user.location).not_to be_empty
  end

  it "should have a valid email" do
  FactoryGirl.build(:user, :email => "EmailNoAtSymbol").should_not be_valid
  end
end
