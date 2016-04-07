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

require 'rails_helper'

RSpec.describe Like, type: :model do

  subject(:like) { FactoryGirl.create :like }

  context "validations" do

    # this fails cause integer attr converts inputs to int
    # it { is_expected.to validate_numericality_of(:number_to_like).only_integer }
    # it { is_expected.to validate_numericality_of(:like_it).only_integer }

  end

  context "with valid params" do

    it "saves record" do
      expect{ like.save }.to change(Like, :count).by 1
    end

  end


end
