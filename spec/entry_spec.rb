require('entry')
require('rspec')

describe(Entry) do
  describe("#initialize") do
    it('will check the initial attributes') do
      test_entry = Entry.new({:meaning => "an act of entering; entrance."})
      expect(test_entry.meaning).to(eq('an act of entering; entrance.'))
    end
  end
end
