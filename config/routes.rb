Discountwheel::Application.routes.draw do

  get 'wheel',      to: 'wheel#index'
  get 'wheel/spin', to: 'wheel#spin'

  get  '/callback', to: 'sessions#index'
  post '/',         to: 'sessions#create'

end