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

  subject(:like) { FactoryGirl.build :like }

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


  describe "::like_toggle" do

    let(:number) { 1234 }

    it "creates new record if number doesn't exists" do
      expect { Like.like_toggle(number) }.to change(Like, :count).by 1
    end

    context "record exists" do

      before do
        like.number_to_like = number
        like.like_it = 1
        like.save
      end

      it "doesn't create new record" do
        expect { Like.like_toggle(number) }.to change(Like, :count).by 0
      end

      it "set like_it to 0 if number is in DB" do
        Like.like_toggle(like.number_to_like)
        set_like = Like.find_by_number_to_like(like.number_to_like)
        expect(set_like.like_it).to be == 0
      end

    end

  end

end
