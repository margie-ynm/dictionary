require('word')
require('rspec')

describe(Word) do
  describe("#initialize") do
    it('will check the initial attributes') do
      test_word = Word.new({:name => "extraordinary"})
      expect(test_word.name).to(eq('extraordinary'))
      expect(test_word.term_list).to(eq([]))
    end
  end
end
