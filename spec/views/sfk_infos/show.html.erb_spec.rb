require 'rails_helper'

RSpec.describe "sfk_infos/show", type: :view do
  before(:each) do
    @sfk_info = assign(:sfk_info, SfkInfo.create!(
      mission: "Mission",
      history: "History"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Mission/)
    expect(rendered).to match(/History/)
  end
end
