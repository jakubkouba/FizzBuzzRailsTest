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

FactoryGirl.define do

  factory :like do
    number_to_like 1
  end
end
