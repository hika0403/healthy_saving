require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
    # Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    # Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  context '新規登録できること' do
    # it 'Goggle認証できること' do
    #   visit new_user_registration_path
    #   expect {
    #     find(".snsButtons_google").click
    #     sleep 1
    #   }.to change { User.count }.by(1)
    # end
    it '正しい情報を入力すればユーザー新規登録ができて新規登録完了ページに移動する' do
      visit new_user_registration_path
      fill_in 'user_family_name', with: @user.family_name
      fill_in 'user_given_name', with: @user.given_name
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      fill_in 'user_nickname', with: @user.nickname
      select '1999',from: 'user_birth_day_1i'
      select '12',from: 'user_birth_day_2i'
      select '12',from: 'user_birth_day_3i'
      expect {
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      expect(current_path).to eq(money_index_path)
    end
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      visit new_user_registration_path
      fill_in 'user_family_name', with: ''
      fill_in 'user_given_name', with: ''
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      fill_in 'user_password_confirmation', with: ''
      fill_in 'user_nickname', with: ''
      select '1999',from: 'user_birth_day_1i'
      select '12',from: 'user_birth_day_2i'
      select '12',from: 'user_birth_day_3i'
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      expect(current_path).to eq user_registration_path
    end
  end


  # context 'サインアップ済みの場合' do
  #   before do
  #     User.create!(
  #     email: 'test@example.com',
  #     password: 'test12'
  #     )
  #   end

  #   it 'ユーザーは増えないこと' do
  #     visit new_user_registration_path
  #     expect{
  #       click_link '.snsButtons_google'
  #       sleep 1
  #     }.to_not change(User, :count)
      
  #   end
  # end
end
