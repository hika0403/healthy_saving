require 'rails_helper'

RSpec.describe MoneyBody, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @money_body = FactoryBot.build(:money_body, user_id: @user.id)
  end

  describe '今日の記録' do
    context '記録できるとき' do
      it '全ての入力があればできること' do
        expect(@money_body).to be_valid
      end
      it 'saving_amontが半角数字であればできること' do
        @money_body.saving_amount = '123'
        @money_body.save
        expect(@money_body).to be_valid
      end
      it 'saving_amontが3桁以内であればできること' do
        @money_body.saving_amount = '123'
        @money_body.save
        expect(@money_body).to be_valid
      end
    end
    context '記録できないとき' do
      it 'saving_amountが空ではできないこと' do
        @money_body.saving_amount = ''
        @money_body.valid?
        expect(@money_body.errors.full_messages).to include "Saving amount can't be blank"
      end
      it 'saving_amontが半角数字以外ではできないこと' do
        @money_body.saving_amount = '１２３'
        @money_body.valid?
        expect(@money_body.errors.full_messages).to include "Saving amount is not a number"
      end
      it 'weightが空ではできないこと' do
        @money_body.weight = ''
        @money_body.valid?
        expect(@money_body.errors.full_messages).to include "Weight can't be blank"
      end
      it 'weightが4桁以上ではできないこと' do
        @money_body.weight = '1234'
        @money_body.valid?
        expect(@money_body.errors.full_messages).to include "Weight is invalid"
      end
      it 'weightが半角数字以外ではできないこと' do
        @money_body.weight = '１２３'
        @money_body.valid?
        expect(@money_body.errors.full_messages).to include "Weight is invalid"
      end
      it 'user_idが空ではできないこと' do
        @money_body.user_id = ''
        @money_body.valid?
        expect(@money_body.errors.full_messages).to include "User can't be blank"
      end
    end
  end
end
