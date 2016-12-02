require('word')
require('rspec')

require('word')
require('rspec')

describe(Word) do
  describe("#initialize") do
    it('will initialize attribute') do
      test_word = Word.new({:name => "extraordinary"})
      expect(test_word.name).to(eq('extraordinary'))
    end
  end
end
