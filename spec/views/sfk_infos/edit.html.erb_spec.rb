require 'rails_helper'

RSpec.describe 'sfk_infos/edit', type: :view do
  before do
    @sfk_info = assign(:sfk_info, SfkInfo.create!(
                                    mission: 'MyString',
                                    history: 'MyString'
                                  ))
  end

  it 'renders the edit sfk_info form' do
    render

    assert_select 'form[action=?][method=?]', sfk_info_path(@sfk_info), 'post' do
      assert_select 'input[name=?]', 'sfk_info[mission]'

      assert_select 'input[name=?]', 'sfk_info[history]'
    end
  end
end
