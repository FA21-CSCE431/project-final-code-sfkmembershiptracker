require 'rails_helper'

RSpec.describe "sfk_infos/index", type: :view do
  before(:each) do
    assign(:sfk_infos, [
      SfkInfo.create!(
        mission: "Mission",
        history: "History"
      ),
      SfkInfo.create!(
        mission: "Mission",
        history: "History"
      )
    ])
  end

  it "renders a list of sfk_infos" do
    render
    assert_select "tr>td", text: "Mission".to_s, count: 2
    assert_select "tr>td", text: "History".to_s, count: 2
  end
end
