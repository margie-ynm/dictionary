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
  describe('/') do
    it('displays all words') do
      visit('/')
      click_link('Add a new word')
      fill_in('word_name', :with => "Enlightened")
      click_button('Add word')
      click_link('Home Page')
      expect(page).to have_content("Enlightened")
    end
  end
  describe('/entry_new') do
    it ('creates a new entry under existing word') do
      visit('/')
      click_link('Add a new word')
      fill_in('word_name', :with=> "Extraordinary")
      click_button('Add word')
      click_link('Home Page')
      click_link('Extraordinary')
      click_link('Add definition(s)')
      fill_in('entry_new', :with=> 'beyond what is usual, ordinary, regular, or established')
      click_button('Add entry')
      click_link('Home Page')
      click_link('Extraordinary')
      expect(page).to have_content('beyond what is usual, ordinary, regular, or established')
    end
  end
end
