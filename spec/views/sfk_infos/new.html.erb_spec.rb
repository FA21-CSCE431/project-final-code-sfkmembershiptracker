require 'rails_helper'

RSpec.describe 'sfk_infos/new', type: :view do
  before do
    assign(:sfk_info, SfkInfo.new(
                        mission: 'MyString',
                        history: 'MyString'
                      ))
  end

  it 'renders new sfk_info form' do
    render

    assert_select 'form[action=?][method=?]', sfk_infos_path, 'post' do
      assert_select 'input[name=?]', 'sfk_info[mission]'

      assert_select 'input[name=?]', 'sfk_info[history]'
    end
  end
end
