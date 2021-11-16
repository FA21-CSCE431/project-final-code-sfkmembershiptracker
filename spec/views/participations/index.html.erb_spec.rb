require 'rails_helper'

RSpec.describe 'participations/index', type: :view do
  before do
    assign(:participations, [
             Participation.create!(
               event_id: '',
               member_email: 'Member Email',
               user_code: 'User Code'
             ),
             Participation.create!(
               event_id: '',
               member_email: 'Member Email',
               user_code: 'User Code'
             )
           ])
  end

  it 'renders a list of participations' do
    render
    assert_select 'tr>td', text: ''.to_s, count: 2
    assert_select 'tr>td', text: 'Member Email'.to_s, count: 2
    assert_select 'tr>td', text: 'User Code'.to_s, count: 2
  end
end
