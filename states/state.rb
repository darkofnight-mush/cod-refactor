module Cod
  class State
    attr_reader :key,
                :display_name,
                :allowed_templates,
                :chargen_selectable,
                :staff_assignable,
                :description

    def initialize(
      key:,
      display_name:,
      allowed_templates:,
      chargen_selectable:,
      staff_assignable:,
      description: nil
    )
      @key = key.to_sym
      @display_name = display_name
      @allowed_templates = allowed_templates.map(&:to_sym)
      @chargen_selectable = chargen_selectable
      @staff_assignable = staff_assignable
      @description = description
    end

    def allowed_for_template?(template)
      allowed_templates.include?(template.to_sym)
    end
  end
end
