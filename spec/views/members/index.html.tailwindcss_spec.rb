require 'rails_helper'

RSpec.describe 'members/index', type: :view do
  before do
    assign(:members, [
             Member.create!(
               first_name: 'First Name',
               last_name: 'Last Name',
               email: 'Email',
               phone: 'Phone',
               role: '',
               points: ''
             ),
             Member.create!(
               first_name: 'First Name',
               last_name: 'Last Name',
               email: 'Email',
               phone: 'Phone',
               role: '',
               points: ''
             )
           ])
  end

  it 'renders a list of members' do
    render
    assert_select 'tr>td', text: 'First Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Last Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Email'.to_s, count: 2
    assert_select 'tr>td', text: 'Phone'.to_s, count: 2
    assert_select 'tr>td', text: ''.to_s, count: 2
    assert_select 'tr>td', text: ''.to_s, count: 2
  end
end
