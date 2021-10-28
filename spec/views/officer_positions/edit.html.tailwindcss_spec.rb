require 'rails_helper'

RSpec.describe "officer_positions/edit", type: :view do
  before(:each) do
    @officer_position = assign(:officer_position, OfficerPosition.create!(
      role: "MyString",
      member_id: ""
    ))
  end

  it "renders the edit officer_position form" do
    render

    assert_select "form[action=?][method=?]", officer_position_path(@officer_position), "post" do

      assert_select "input[name=?]", "officer_position[role]"

      assert_select "input[name=?]", "officer_position[member_id]"
    end
  end
end
