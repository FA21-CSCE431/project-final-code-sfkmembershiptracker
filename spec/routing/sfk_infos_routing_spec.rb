require 'rails_helper'

RSpec.describe SfkInfosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/sfk_infos').to route_to('sfk_infos#index')
    end

    it 'routes to #new' do
      expect(get: '/sfk_infos/new').to route_to('sfk_infos#new')
    end

    it 'routes to #show' do
      expect(get: '/sfk_infos/1').to route_to('sfk_infos#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/sfk_infos/1/edit').to route_to('sfk_infos#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/sfk_infos').to route_to('sfk_infos#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/sfk_infos/1').to route_to('sfk_infos#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/sfk_infos/1').to route_to('sfk_infos#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/sfk_infos/1').to route_to('sfk_infos#destroy', id: '1')
    end
  end
end
