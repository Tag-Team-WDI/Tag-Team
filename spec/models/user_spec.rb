require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { FactoryGirl.create(:user)}

  it "has first_name John" do
    expect(user.first_name).to eq("John")
  end

end

