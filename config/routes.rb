Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    root "calendar#index",  as: :localized_root # Главная страница приложения
    get "calendar", to: "calendar#index"
    resources :tasks
    resources :webinars
    resources :events
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.

    # Development tools
    namespace :dev do
      get "recurrence-ui",
        to: "recurrence_previews#index",
        as: :recurrence_ui
    end

  end 
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
