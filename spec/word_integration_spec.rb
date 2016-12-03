require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application

describe("testing the site", {:type => :feature}) do
  before()do
    Word.clear
  end
  describe('/') do
    it('routes to the home path') do
      visit('/')
      expect(page).to have_content('Build Your Own Dictionary')
    end
  end
  describe('/word/new') do
    it('creates a new word') do
      visit('/')
      click_link('Add a new word')
      fill_in('word_name', :with=> "Enlightened")
      click_button('Add word')
      expect(page).to have_content('Success')
    end
  end
  describe('/words') do
    it('displays all words') do
      visit('/')
      click_link('All Words')
      expect(page).to have_content('Word List')
    end
  end
  describe('/entry_new') do
    Word.clear()
    it 'creates a new entry under existing word' do
      visit('/word/new')
      fill_in('word_name', :with=> "Enlightened")
      click_button('Add word')
      visit('words/1')
      click_link('Add definitions')
      fill_in('type', :with=> 'to give intellectual or spiritual light to; instruct; impart knowledge to')
      click_button('Add entry')
      expect(page).to have_content('Success')
    end
  end
end
