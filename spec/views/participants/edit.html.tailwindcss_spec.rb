require 'rails_helper'

RSpec.describe 'participants/edit', type: :view do
  before do
    @participant = assign(:participant, Participant.create!(
                                          event_id: 1,
                                          member_id: 1
                                        ))
  end

  it 'renders the edit participant form' do
    render

    assert_select 'form[action=?][method=?]', participant_path(@participant), 'post' do
      assert_select 'input[name=?]', 'participant[event_id]'

      assert_select 'input[name=?]', 'participant[member_id]'
    end
  end
end
