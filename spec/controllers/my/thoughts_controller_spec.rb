# frozen_string_literal: true

require 'rails_helper'
require_relative '../../support/devise'

RSpec.describe My::ThoughtsController, type: :controller do
  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'GET #index' do
    let!(:user) { create(:user, :with_thoughts) }
    before { sign_in user }

    subject { get :index }
    it 'returns a success response' do
      expect(subject).to render_template(:index)
      expect(subject).to have_http_status(:success)
      expect(controller.current_user).to eq(user)
      expect(controller.current_user.thoughts.count).to eq(2)
    end
  end

  describe 'POST #create' do
    let!(:user) { create(:user, :with_thoughts) }
    before { sign_in user }

    context 'with valid params' do
      subject { post :create, params: { thought: attributes_for(:thought) } }
      it 'creates a new user' do
        expect { subject }.to change(Thought, :count).by(1)
        expect(subject).to redirect_to(my_thoughts_path)
      end
    end

    context 'with invalid params' do
      let!(:invalid_thought) { build(:thought, :invalid) }

      subject { post :create, params: { user: attributes_for(invalid_thought) } }
      it 'does not create a thought' do
        expect { subject }.to_not change(Thought, :count)
      end
    end
  end

  describe 'PUT #hide' do
    let!(:user) { create(:user, :with_thoughts) }
    let!(:thought) { user.thoughts.first }
    before { sign_in user }

    context 'with valid params' do
      subject { put :hide, params: { id: thought.id } }
      it 'hides the thought' do
        expect(thought.visible).to be_false
        expect(subject).to redirect_to(my_thoughts_path)
      end
    end
  end

  describe 'GET #edit' do
    let!(:user) { create(:user, :with_thoughts) }
    let!(:thought) { user.thoughts.first }
    before { sign_in user }

    context 'with valid params' do
      subject { get :edit, params: { id: thought.id } }
      it 'edits the thought' do
        expect(subject).to render_template(:edit)
        expect(subject).to have_http_status(:success)
      end
    end
  end

  describe 'PATCH #update' do
    let!(:user) { create(:user, :with_thoughts) }
    let!(:thought) { user.thoughts.first }
    before { sign_in user }

    context 'with valid params' do
      subject { patch :update, params: { id: thought.id, thought: { content: 'New content' } } }
      it 'updates the thought' do
        expect(thought.content).to eq('New content')
        expect(subject).to redirect_to(my_thoughts_path)
      end
    end

    context 'with invalid params' do
      subject { patch :update, params: { id: thought.id, thought: { content: '' } } }
      it 'does not update the thought' do
        expect(thought.content).to eq('Content')
        expect(subject).to render_template(:edit)
      end
    end
  end
end
