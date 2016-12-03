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

get('/words') do
  @words = Word.all()
  erb(:words)
end

get('/words/:id') do
  id = params.fetch('id').to_i
  @word = Word.find(id)
  erb(:word)
end





#ToDo: create page for all words
#create page for each word
#then need option to create definition on page of word i.e. another route for new form for terms with id for word
