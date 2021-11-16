require 'rails_helper'

RSpec.describe 'participants/index', type: :view do
  before do
    assign(:participants, [
             Participant.create!(
               event_id: 2,
               member_id: 3
             ),
             Participant.create!(
               event_id: 2,
               member_id: 3
             )
           ])
  end

  it 'renders a list of participants' do
    render
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
  end
end
