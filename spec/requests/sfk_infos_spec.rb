require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/sfk_infos', type: :request do
  # SfkInfo. As you add validations to SfkInfo, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      SfkInfo.create! valid_attributes
      get sfk_infos_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      sfk_info = SfkInfo.create! valid_attributes
      get sfk_info_url(sfk_info)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_sfk_info_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      sfk_info = SfkInfo.create! valid_attributes
      get edit_sfk_info_url(sfk_info)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new SfkInfo' do
        expect do
          post sfk_infos_url, params: { sfk_info: valid_attributes }
        end.to change(SfkInfo, :count).by(1)
      end

      it 'redirects to the created sfk_info' do
        post sfk_infos_url, params: { sfk_info: valid_attributes }
        expect(response).to redirect_to(sfk_info_url(SfkInfo.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new SfkInfo' do
        expect do
          post sfk_infos_url, params: { sfk_info: invalid_attributes }
        end.to change(SfkInfo, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post sfk_infos_url, params: { sfk_info: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested sfk_info' do
        sfk_info = SfkInfo.create! valid_attributes
        patch sfk_info_url(sfk_info), params: { sfk_info: new_attributes }
        sfk_info.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the sfk_info' do
        sfk_info = SfkInfo.create! valid_attributes
        patch sfk_info_url(sfk_info), params: { sfk_info: new_attributes }
        sfk_info.reload
        expect(response).to redirect_to(sfk_info_url(sfk_info))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        sfk_info = SfkInfo.create! valid_attributes
        patch sfk_info_url(sfk_info), params: { sfk_info: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested sfk_info' do
      sfk_info = SfkInfo.create! valid_attributes
      expect do
        delete sfk_info_url(sfk_info)
      end.to change(SfkInfo, :count).by(-1)
    end

    it 'redirects to the sfk_infos list' do
      sfk_info = SfkInfo.create! valid_attributes
      delete sfk_info_url(sfk_info)
      expect(response).to redirect_to(sfk_infos_url)
    end
  end
end
