Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  namespace :my do
    resources :thoughts, only: [:index, :create, :edit, :update] do
      member do
        put :hide
      end
    end
  end
end
