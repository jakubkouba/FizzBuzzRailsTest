# == Schema Information
#
# Table name: likes
#
#  id             :integer          not null, primary key
#  number_to_like :integer          not null
#  like_it        :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Like < ActiveRecord::Base

  validates :number_to_like, :like_it, numericality: :only_integer

  # Saves number and like
  #
  # if number is new record it creates it and set like_it to 1
  # if number is already in DB it sets like_it to 0
  def self.like_toggle(number)
    like = self.find_by_number_to_like number
    if like
      case like.like_it
        when 0
          like.like_it = 1
          like.save!
          return true
        when 1
          like.like_it = 0
          like.save!
          return false
      end
    else
      self.create!(number_to_like: number, like_it: 1)
      return true
    end
  end

  def self.get_likes(from, to)
    self.where(number_to_like: from..to).to_a
  end

end
