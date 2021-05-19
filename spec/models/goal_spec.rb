require 'rails_helper'

RSpec.describe Goal, type: :model do
  before do
    @goal = FactoryBot.build(:goal)
  end

  describe 'ゴールを設定する' do
    context '設定できるとき' do
      it '全ての入力があれば登録できること' do
        expect(@goal).to be_valid
      end
      it 'weight_goalが半角数字であれば登録できる' do
        @goal.weight_goal = 78987
        @goal.save
        expect(@goal).to be_valid
      end
      it 'saving_goalが半角数字であれば登録できる' do
        @goal.saving_goal = 23456789
        @goal.save
        expect(@goal).to be_valid
      end
    end
    context '設定できないとき' do
      it 'weight_goalが空ではできない' do
        @goal.weight_goal = ''
        @goal.valid?
        expect(@goal.errors.full_messages).to include "Weight goal can't be blank"
      end
      it 'weight_goalが半角数字でないとできない' do
        @goal.weight_goal = '123abc'
        @goal.valid?
        expect(@goal.errors.full_messages).to include "Weight goal is not a number"
      end
      it 'saving_goalが空ではできない' do
        @goal.saving_goal = ''
        @goal.valid?
        expect(@goal.errors.full_messages).to include "Saving goal can't be blank"
      end
      it 'saving_goalが半角数字でないとできない' do
        @goal.saving_goal = '123abc'
        @goal.valid?
        expect(@goal.errors.full_messages).to include "Saving goal is not a number"
      end
      it 'purposeが空ではできない' do
        @goal.purpose = ''
        @goal.valid?
        expect(@goal.errors.full_messages).to include "Purpose can't be blank"
      end
      it 'periodが空ではできない' do
        @goal.period = ''
        @goal.valid?
        expect(@goal.errors.full_messages).to include "Period can't be blank"
      end
    end
  end
end
