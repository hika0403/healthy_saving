require 'rails_helper'

RSpec.describe 'ゴール新規登録', type: :system do
  before do
    @goal = FactoryBot.build(:goal)
    @user = FactoryBot.create(:user)
  end

  context '新規登録できること' do
    it '正しい情報を入力すればゴール新規登録ができてトップページに移動する' do
      sign_in @user
      visit new_goal_path
      fill_in 'goal_saving_goal', with: @goal.saving_goal
      fill_in 'goal_weight_goal', with: @goal.weight_goal
      select '2022', from: 'goal_period_1i'
      select '12', from: 'goal_period_2i'
      select '12', from: 'goal_period_3i'
      fill_in 'goal_purpose', with: @goal.purpose
      expect do
        find('input[name="commit"]').click
      end.to change { Goal.count }.by(1)
      expect(current_path).to eq(money_index_path)
    end
    it '誤った情報ではゴール新規登録ができずに新規登録ページへ戻ってくる' do
      sign_in @user
      visit new_goal_path
      fill_in 'goal_saving_goal', with: ''
      fill_in 'goal_weight_goal', with: ''
      select '2022', from: 'goal_period_1i'
      select '12', from: 'goal_period_2i'
      select '12', from: 'goal_period_3i'
      fill_in 'goal_purpose', with: ''
      expect do
        find('input[name="commit"]').click
      end.to change { Goal.count }.by(0)
      expect(current_path).to eq(goals_path)
    end
  end
end
