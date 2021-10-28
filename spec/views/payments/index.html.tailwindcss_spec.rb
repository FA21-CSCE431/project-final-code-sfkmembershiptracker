require 'rails_helper'

RSpec.describe "payments/index", type: :view do
  before(:each) do
    assign(:payments, [
      Payment.create!(
        member_id: 2,
        amount: "9.99",
        description: "Description"
      ),
      Payment.create!(
        member_id: 2,
        amount: "9.99",
        description: "Description"
      )
    ])
  end

  it "renders a list of payments" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
  end
end
