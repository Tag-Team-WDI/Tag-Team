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
  
  it "has a location listed" do
    expect(user.location).not_to be_empty
  end

  it "should have a valid email" do
  FactoryGirl.build(:user, :email => "EmailNoAtSymbol").should_not be_valid
  end

  describe "when email address is already taken" do
    before do
      @test_email = FactoryGirl.build(:user, :email => "Tapioca@gmail.com")
    end
  
  it "should have a unique email" do
      expect(@test_email).not_to be_valid
    end 
  end
end
