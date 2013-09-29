Discountwheel::Application.routes.draw do

  get  '/wheel/spin',           to: 'wheel#spin'
  get  '/wheel/already_played', to: 'wheel#already_played'
  get  '/callback',             to: 'sessions#index'

  get  '/wheel',                to: 'wheel#index'
  post '/',                     to: 'sessions#create'

end