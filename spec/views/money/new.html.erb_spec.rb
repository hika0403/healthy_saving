require 'rails_helper'

RSpec.describe "money/new", type: :view do
  before(:each) do
    assign(:money, Money.new(
      saving_amount: "MyString",
      day: "",
      text: "MyString",
      goal: "",
      user: ""
    ))
  end

  it "renders new money form" do
    render

    assert_select "form[action=?][method=?]", money_index_path, "post" do

      assert_select "input[name=?]", "money[saving_amount]"

      assert_select "input[name=?]", "money[day]"

      assert_select "input[name=?]", "money[text]"

      assert_select "input[name=?]", "money[goal]"

      assert_select "input[name=?]", "money[user]"
    end
  end
end
