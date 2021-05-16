require 'rails_helper'

RSpec.describe MoneyController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/money').to route_to('money#index')
    end

    it 'routes to #new' do
      expect(get: '/money/new').to route_to('money#new')
    end

    it 'routes to #show' do
      expect(get: '/money/1').to route_to('money#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/money/1/edit').to route_to('money#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/money').to route_to('money#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/money/1').to route_to('money#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/money/1').to route_to('money#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/money/1').to route_to('money#destroy', id: '1')
    end
  end
end
