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

RSpec.describe "/officer_positions", type: :request do
  
  # OfficerPosition. As you add validations to OfficerPosition, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      OfficerPosition.create! valid_attributes
      get officer_positions_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      officer_position = OfficerPosition.create! valid_attributes
      get officer_position_url(officer_position)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_officer_position_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      officer_position = OfficerPosition.create! valid_attributes
      get edit_officer_position_url(officer_position)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new OfficerPosition" do
        expect {
          post officer_positions_url, params: { officer_position: valid_attributes }
        }.to change(OfficerPosition, :count).by(1)
      end

      it "redirects to the created officer_position" do
        post officer_positions_url, params: { officer_position: valid_attributes }
        expect(response).to redirect_to(officer_position_url(OfficerPosition.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new OfficerPosition" do
        expect {
          post officer_positions_url, params: { officer_position: invalid_attributes }
        }.to change(OfficerPosition, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post officer_positions_url, params: { officer_position: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested officer_position" do
        officer_position = OfficerPosition.create! valid_attributes
        patch officer_position_url(officer_position), params: { officer_position: new_attributes }
        officer_position.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the officer_position" do
        officer_position = OfficerPosition.create! valid_attributes
        patch officer_position_url(officer_position), params: { officer_position: new_attributes }
        officer_position.reload
        expect(response).to redirect_to(officer_position_url(officer_position))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        officer_position = OfficerPosition.create! valid_attributes
        patch officer_position_url(officer_position), params: { officer_position: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested officer_position" do
      officer_position = OfficerPosition.create! valid_attributes
      expect {
        delete officer_position_url(officer_position)
      }.to change(OfficerPosition, :count).by(-1)
    end

    it "redirects to the officer_positions list" do
      officer_position = OfficerPosition.create! valid_attributes
      delete officer_position_url(officer_position)
      expect(response).to redirect_to(officer_positions_url)
    end
  end
end
