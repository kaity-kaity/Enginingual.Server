Rails.application.routes.draw do
  get '/getTranslation',   to: 'words#word_post'
end
