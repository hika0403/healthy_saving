require 'rails_helper'

RSpec.describe 'money/show', type: :view do
  before(:each) do
    @money = assign(:money, Money.create!(
                              saving_amount: 'Saving Amount',
                              day: '',
                              text: 'Text',
                              goal: '',
                              user: ''
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Saving Amount/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Text/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
