Rails.application.routes.draw do
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
  end

  delete "doses/:id", to: "doses#destroy", as: :destroy_dose
# #   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
