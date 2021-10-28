require 'rails_helper'

RSpec.describe "payments/new", type: :view do
  before(:each) do
    assign(:payment, Payment.new(
      member_id: 1,
      amount: "9.99",
      description: "MyString"
    ))
  end

  it "renders new payment form" do
    render

    assert_select "form[action=?][method=?]", payments_path, "post" do

      assert_select "input[name=?]", "payment[member_id]"

      assert_select "input[name=?]", "payment[amount]"

      assert_select "input[name=?]", "payment[description]"
    end
  end
end
