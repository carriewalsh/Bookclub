class Review < ApplicationRecord
  belongs_to :book

  validates_presence_of :username,
                        :title,
                        :rating,
                        :review_text

  def self.sort_reviews_by_created_at(order)
    if (order == :asc)
      order(created_at: :asc)
    elsif
      order(created_at: :desc)
    end
  end

end
