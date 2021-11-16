require 'rails_helper'

RSpec.describe 'participations/edit', type: :view do
  before do
    @participation = assign(:participation, Participation.create!(
                                              event_id: '',
                                              member_email: 'MyString',
                                              user_code: 'MyString'
                                            ))
  end

  it 'renders the edit participation form' do
    render

    assert_select 'form[action=?][method=?]', participation_path(@participation), 'post' do
      assert_select 'input[name=?]', 'participation[event_id]'

      assert_select 'input[name=?]', 'participation[member_email]'

      assert_select 'input[name=?]', 'participation[user_code]'
    end
  end
end
