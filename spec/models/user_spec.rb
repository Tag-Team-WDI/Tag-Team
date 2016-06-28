require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { FactoryGirl.create(:user)}

  it "has first name" do
    expect(user.first_name).not_to be_empty
  end

  it "has a last name" do
    expect(user.last_name).to eq(user.last_name)
  end

  it "has an email and it is unique" do
    expect(user.email).to_be_unique
    expect(user.email).not_to be_empty
  end


end
