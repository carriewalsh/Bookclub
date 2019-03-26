class Review < ApplicationRecord
  belongs_to :book

  validates_presence_of :username,
                        :title,
                        :rating,
                        :review_text

  def self.sort_reviews_by_created_at(order)
    if (order == :asc)
      order("reviews.created_at asc")
    else
      order("reviews.created_at desc")
    end
  end

<<<<<<< HEAD
  def self.fooling_around
    binding.pry
=======
  # def self.take_top_three_reviewer_usernames
  #   group(:username).order("reviews.count DESC").limit(3).count
  # end

  def self.take_top_three_reviewers
    select("reviews.username, count(reviews.id) as review_count").group(:username).order("review_count DESC").limit(3)
>>>>>>> 856487ba863307583d618cf02a76a5c2ebecb70b
  end
end
