require 'rails_helper'

RSpec.describe 'members/edit', type: :view do
  before do
    @member = assign(:member, Member.create!(
                                first_name: 'MyString',
                                last_name: 'MyString',
                                email: 'MyString',
                                phone: 'MyString',
                                role: '',
                                points: ''
                              ))
  end

  it 'renders the edit member form' do
    render

    assert_select 'form[action=?][method=?]', member_path(@member), 'post' do
      assert_select 'input[name=?]', 'member[first_name]'

      assert_select 'input[name=?]', 'member[last_name]'

      assert_select 'input[name=?]', 'member[email]'

      assert_select 'input[name=?]', 'member[phone]'

      assert_select 'input[name=?]', 'member[role]'

      assert_select 'input[name=?]', 'member[points]'
    end
  end
end
