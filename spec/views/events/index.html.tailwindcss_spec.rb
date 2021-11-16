require 'rails_helper'

RSpec.describe 'events/index', type: :view do
  before do
    assign(:events, [
             Event.create!(
               name: 'Name',
               location: 'Location',
               points: ''
             ),
             Event.create!(
               name: 'Name',
               location: 'Location',
               points: ''
             )
           ])
  end

  it 'renders a list of events' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Location'.to_s, count: 2
    assert_select 'tr>td', text: ''.to_s, count: 2
  end
end
