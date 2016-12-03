require('./lib/word')
require('./lib/entry')
require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/word/new') do
  erb(:word_form)
end
