Rails.application.routes.draw do
  get 'api/v1/shipments', to: 'shipments#index', as: :index
  
end
