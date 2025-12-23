module Cod
  class StatCategory
    attr_reader :key, :name, :stats

    def initialize(key:, name:, stats:)
      @key = key.to_sym
      @name = name
      @stats = stats
    end
  end
end
