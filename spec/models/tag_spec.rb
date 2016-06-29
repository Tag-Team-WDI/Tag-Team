require 'rails_helper'
#NOT DONE! LOOK AWAY!
RSpec.describe Tag, type: :model do
  subject(:tag) { FactoryGirl.create(:tag)}
  it "has a art_id from tag " do
    expect(tag.art_id).to be_truthy
  end
  it "has a user_id from tag" do
    expect(tag.user_id).to be_truthy
  end
  it "has a category from a user" do
    expect(tag.category).not_to be_empty
  end
end