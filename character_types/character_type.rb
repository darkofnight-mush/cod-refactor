module Cod
  class CharacterType
    attr_reader :key, :display_name, :base_template, :states, :description

    def initialize(key:, display_name:, base_template:, states:, description: nil)
      @key = key.to_sym
      @display_name = display_name
      @base_template = base_template.to_sym
      @states = states.map(&:to_sym)
      @description = description
    end

    def mortal_based?
      base_template == :mortal
    end
  end
end
