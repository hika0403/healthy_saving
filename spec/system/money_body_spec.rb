require 'rails_helper'

RSpec.describe '今日の記録', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @money_body = FactoryBot.build(:money_body, user_id: @user.id)
  end

  context '記録できること' do
    it '正しい情報を入力すれば記録ができてトップページに移動する' do
      sign_in @user
      visit new_money_path
      fill_in 'money_body_saving_amount', with: @money_body.saving_amount
      fill_in 'money_body_weight', with: @money_body.weight
      fill_in 'money_body_text', with: @money_body.text
      click_button 'Record'
      page.driver.browser.switch_to.alert.accept
      expect(current_path).to eq(money_index_path)
    end
    it '誤った情報では記録ができずに記録ページへ戻ってくる' do
      sign_in @user
      visit new_money_path
      fill_in 'money_body_saving_amount', with: ''
      fill_in 'money_body_weight', with: ''
      fill_in 'money_body_text', with: ''
      expect {
        find('input[name="commit"]').click
        page.driver.browser.switch_to.alert.accept
      }.to change { Money.count }.by(0)
    end
  end
end
