class Art < ActiveRecord::Base
<<<<<<< HEAD
  has_many :tags
  def self.search(text)
    query = "%#{text}%"
    if text.present?
      return where("vision LIKE ?", query)
    end
  end
end
