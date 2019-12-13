Rails.application.routes.draw do
  root to: 'words#select'
  get 'words/select'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
