require 'rails_helper'

RSpec.describe "applications/edit", type: :view do
  before(:each) do
    @application = assign(:application, Application.create!(
      first_name: "MyString",
      last_name: "MyString",
      email: "MyString",
      phone: "MyString",
      status: "MyString",
      question: "MyString"
    ))
  end

  it "renders the edit application form" do
    render

    assert_select "form[action=?][method=?]", application_path(@application), "post" do

      assert_select "input[name=?]", "application[first_name]"

      assert_select "input[name=?]", "application[last_name]"

      assert_select "input[name=?]", "application[email]"

      assert_select "input[name=?]", "application[phone]"

      assert_select "input[name=?]", "application[status]"

      assert_select "input[name=?]", "application[question]"
    end
  end
end
