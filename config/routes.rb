Discountwheel::Application.routes.draw do

  get  '/',         to: 'wheel#index'
  get  '/spin',     to: 'wheel#spin'

  get  '/callback', to: 'sessions#index'
  post '/',         to: 'sessions#create'

end