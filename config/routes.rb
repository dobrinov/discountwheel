Discountwheel::Application.routes.draw do

  get  '/wheel/terms',          to: 'wheel#terms'
  get  '/wheel/spin',           to: 'wheel#spin'
  get  '/wheel/already_played', to: 'wheel#already_played'
  get  '/callback',             to: 'sessions#index'

  get  '/wheel',                to: 'wheel#index'
  get  '/terms',                to: 'wheel#terms'
  post '/',                     to: 'sessions#create'

  get '/spins/reset',          to: 'spins#reset'
  resources :spins, only: [:index, :update, :destroy]

end