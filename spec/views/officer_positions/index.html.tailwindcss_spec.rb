require 'rails_helper'

RSpec.describe "officer_positions/index", type: :view do
  before(:each) do
    assign(:officer_positions, [
      OfficerPosition.create!(
        role: "Role",
        member_id: ""
      ),
      OfficerPosition.create!(
        role: "Role",
        member_id: ""
      )
    ])
  end

  it "renders a list of officer_positions" do
    render
    assert_select "tr>td", text: "Role".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
