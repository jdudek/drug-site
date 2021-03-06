Drug::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root :to => "home#index"
  devise_for :users

  localized do
    resources :news_articles, :only => [:index, :show]
    resources :events, :only => [:index, :show] do
      resources :attendants, :only => [:index]
    end
    resource :contact, :only => [:show, :create]
  end
end
