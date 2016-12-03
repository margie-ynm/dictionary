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

post('/words') do
  word_name = params.fetch('word_name')
  Word.new({:name => word_name}).save()
  erb(:success)
end
