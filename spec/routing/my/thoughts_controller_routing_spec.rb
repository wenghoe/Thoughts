# frozen_string_literal: true

require 'rails_helper'

RSpec.describe My::ThoughtsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/my/thoughts').to route_to('my/thoughts#index')
    end

    it 'routes to #create' do
      expect(post: '/my/thoughts').to route_to('my/thoughts#create')
    end

    it 'routes to #hide' do
      expect(put: '/my/thoughts/1/hide').to route_to('my/thoughts#hide', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/my/thoughts/1/edit').to route_to('my/thoughts#edit', id: '1')
    end

    it 'routes to #update' do
      expect(patch: '/my/thoughts/1/').to route_to('my/thoughts#update', id: '1')
    end
  end
end
