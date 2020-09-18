Rails.application.routes.draw do
  resources :shops do
    resources :custom_fields
    resources :products
  end
end
