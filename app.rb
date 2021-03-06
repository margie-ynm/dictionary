require('./lib/word')
require('./lib/entry')
require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')

set :public_folder, 'public'

get('/') do
  @words = Word.all()
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
