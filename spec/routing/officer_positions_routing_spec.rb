require 'rails_helper'

RSpec.describe OfficerPositionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/officer_positions').to route_to('officer_positions#index')
    end

    it 'routes to #new' do
      expect(get: '/officer_positions/new').to route_to('officer_positions#new')
    end

    it 'routes to #show' do
      expect(get: '/officer_positions/1').to route_to('officer_positions#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/officer_positions/1/edit').to route_to('officer_positions#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/officer_positions').to route_to('officer_positions#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/officer_positions/1').to route_to('officer_positions#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/officer_positions/1').to route_to('officer_positions#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/officer_positions/1').to route_to('officer_positions#destroy', id: '1')
    end
  end
end
