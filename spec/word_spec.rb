require('word')
require('rspec')
require('entry')

describe(Word) do
  before() do
    Word.clear()
  end
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
  describe(".add") do
    it('is empty at first') do
      expect(Word.all()).to(eq([]))
    end
  end
  describe('#save') do
    it('adds a task to the array of saved tasks') do
    test_word = Word.new({:name => "extraordinary"})
    test_word.save()
    expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".clear") do
    it('empties out all of the saved words') do
      Word.new({:name => "energy"})
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#id") do
    it('returns the id of the word') do
      test_word = Word.new({:name => "extraordinary"})
      test_word.save()
      expect(test_word.id()).to(eq(1))
    end
  end
  describe("#find") do
    it('returns a word by its id number') do
      test_word = Word.new(:name => "energy")
      test_word.save()
      test_word2 = Word.new(:name => 'extraordinary')
      test_word2.save()
      expect(Word.find(test_word2.id())).to(eq(test_word2))
    end
  end
end
