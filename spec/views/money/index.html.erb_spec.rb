require 'rails_helper'

RSpec.describe "money/index", type: :view do
  before(:each) do
    assign(:money, [
      Money.create!(
        saving_amount: "Saving Amount",
        day: "",
        text: "Text",
        goal: "",
        user: ""
      ),
      Money.create!(
        saving_amount: "Saving Amount",
        day: "",
        text: "Text",
        goal: "",
        user: ""
      )
    ])
  end

  it "renders a list of money" do
    render
    assert_select "tr>td", text: "Saving Amount".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "Text".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
