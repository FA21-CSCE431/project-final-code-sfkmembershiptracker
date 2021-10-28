require 'rails_helper'

RSpec.describe "officer_positions/show", type: :view do
  before(:each) do
    @officer_position = assign(:officer_position, OfficerPosition.create!(
      role: "Role",
      member_id: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Role/)
    expect(rendered).to match(//)
  end
end
