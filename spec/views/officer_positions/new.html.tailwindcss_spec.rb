require 'rails_helper'

RSpec.describe "officer_positions/new", type: :view do
  before(:each) do
    assign(:officer_position, OfficerPosition.new(
      role: "MyString",
      member_id: ""
    ))
  end

  it "renders new officer_position form" do
    render

    assert_select "form[action=?][method=?]", officer_positions_path, "post" do

      assert_select "input[name=?]", "officer_position[role]"

      assert_select "input[name=?]", "officer_position[member_id]"
    end
  end
end
