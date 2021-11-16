require 'rails_helper'

RSpec.describe 'participations/new', type: :view do
  before do
    assign(:participation, Participation.new(
                             event_id: '',
                             member_email: 'MyString',
                             user_code: 'MyString'
                           ))
  end

  it 'renders new participation form' do
    render

    assert_select 'form[action=?][method=?]', participations_path, 'post' do
      assert_select 'input[name=?]', 'participation[event_id]'

      assert_select 'input[name=?]', 'participation[member_email]'

      assert_select 'input[name=?]', 'participation[user_code]'
    end
  end
end
