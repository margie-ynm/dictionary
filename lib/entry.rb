class Entry

attr_accessor(:meaning)

  define_method(:initialize) do |attributes|
    @meaning = attributes.fetch(:meaning)
  end
end
