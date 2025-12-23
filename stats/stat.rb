module Cod
  class Stat
    attr_reader :key, :name, :category

    def initialize(key:, name:, category:)
      @key = key.to_sym
      @name = name
      @category = category.to_sym
    end
  end
end
