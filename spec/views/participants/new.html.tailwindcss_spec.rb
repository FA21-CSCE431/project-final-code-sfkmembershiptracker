require 'rails_helper'

RSpec.describe 'participants/new', type: :view do
  before do
    assign(:participant, Participant.new(
                           event_id: 1,
                           member_id: 1
                         ))
  end

  it 'renders new participant form' do
    render

    assert_select 'form[action=?][method=?]', participants_path, 'post' do
      assert_select 'input[name=?]', 'participant[event_id]'

      assert_select 'input[name=?]', 'participant[member_id]'
    end
  end
end
