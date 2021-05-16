require 'rails_helper'

RSpec.describe 'money/edit', type: :view do
  before(:each) do
    @money = assign(:money, Money.create!(
                              saving_amount: 'MyString',
                              day: '',
                              text: 'MyString',
                              goal: '',
                              user: ''
                            ))
  end

  it 'renders the edit money form' do
    render

    assert_select 'form[action=?][method=?]', money_path(@money), 'post' do
      assert_select 'input[name=?]', 'money[saving_amount]'

      assert_select 'input[name=?]', 'money[day]'

      assert_select 'input[name=?]', 'money[text]'

      assert_select 'input[name=?]', 'money[goal]'

      assert_select 'input[name=?]', 'money[user]'
    end
  end
end
