class Tag < ActiveRecord::Base
  belongs_to :art
  belongs_to :user
end
