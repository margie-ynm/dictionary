class Word

  @@words = []

  attr_accessor(:name, :term_list, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @term_list = []
    @id = @@words.length().+(1)
  end

  define_method(:add_entry) do |entry|
    @term_list.push(entry)
  end

  define_singleton_method(:all) do
    @@words
  end
  define_method(:save) do
    @@words.push(self)
  end
  define_singleton_method(:clear) do
    @@words = []
  end
  define_singleton_method(:find) do |identification|
    found_word = nil
    @@words.each() do |word|
      if word.id().eql?(identification)
        found_word = word
      end
    end
    found_word
  end
end
