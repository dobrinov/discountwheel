Discountwheel::Application.routes.draw do

  get 'wheel',      to: 'wheel#index'
  get 'wheel/spin', to: 'wheel#spin'

  get  '/', to: 'wheel#index'
  post '/', to: 'wheel#index'

end