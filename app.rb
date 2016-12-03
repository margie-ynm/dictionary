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
  @term_list = @word.term_list
  erb(:word)
end

get('/words/:id/entry_new') do
  id = params.fetch('id').to_i
  @word = Word.find(id)
  erb(:entry_form)
end

post('/definition') do
  entry = params.fetch('entry_new')
  id = params.fetch('word_id').to_i
  @word = Word.find(id)
  @word.add_entry(Entry.new({:meaning=>entry}))
  erb(:success)
end




#ToDo: create page for all words
#create page for each word
#then need option to create definition on page of word i.e. another route for new form for terms with id for word
