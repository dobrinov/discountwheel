Discountwheel::Application.routes.draw do

  get 'wheel',      to: 'wheel#index'
  get 'wheel/spin', to: 'wheel#spin'

  root to: 'wheel#index'

end