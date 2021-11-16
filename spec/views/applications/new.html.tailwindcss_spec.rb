require 'rails_helper'

RSpec.describe 'applications/new', type: :view do
  before do
    assign(:application, Application.new(
                           first_name: 'MyString',
                           last_name: 'MyString',
                           email: 'MyString',
                           phone: 'MyString',
                           status: 'MyString',
                           question: 'MyString'
                         ))
  end

  it 'renders new application form' do
    render

    assert_select 'form[action=?][method=?]', applications_path, 'post' do
      assert_select 'input[name=?]', 'application[first_name]'

      assert_select 'input[name=?]', 'application[last_name]'

      assert_select 'input[name=?]', 'application[email]'

      assert_select 'input[name=?]', 'application[phone]'

      assert_select 'input[name=?]', 'application[status]'

      assert_select 'input[name=?]', 'application[question]'
    end
  end
end
