require('word')
require('rspec')
require('entry')

describe(Word) do
  describe("#initialize") do
    it('will check the initial attributes') do
      test_word = Word.new({:name => "extraordinary"})
      expect(test_word.name).to(eq('extraordinary'))
      expect(test_word.term_list).to(eq([]))
    end
  end
  describe("#add_entry") do
    it('will add the entry to the word') do
      test_word = Word.new({:name => "extraordinary"})
      expect(test_word.name).to(eq('extraordinary'))
      test_entry = Entry.new({:meaning => 'beyond what is usual, ordinary, regular, or established'})
      test_word.add_entry(test_entry)
      expect(test_word.term_list).to(eq([test_entry]))
    end
  end
end
