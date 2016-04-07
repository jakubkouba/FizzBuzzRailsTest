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

end
