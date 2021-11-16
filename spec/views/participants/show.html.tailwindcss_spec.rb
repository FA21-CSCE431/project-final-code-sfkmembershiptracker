require 'rails_helper'

RSpec.describe 'participants/show', type: :view do
  before do
    @participant = assign(:participant, Participant.create!(
                                          event_id: 2,
                                          member_id: 3
                                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
