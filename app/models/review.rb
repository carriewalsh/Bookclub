class Review < ApplicationRecord
  belongs_to :book
  validates_presence_of :name,
                        :username,
                        :rating,
                        :review_text
end
