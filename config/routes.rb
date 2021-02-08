Rails.application.routes.draw do
  resources :job_board_job_opportunities
  resources :job_boards
  resources :job_opportunities
  get '/job_count', to: 'job_boards#job_count'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
