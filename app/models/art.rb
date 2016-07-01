class Art < ActiveRecord::Base
 has_many :tags
 belongs_to :user
 def self.search(text)
   query = "%#{text}%"
   if text.present?
     return where("vision LIKE ?", query)
   end
 end
end
