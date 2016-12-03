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
end
