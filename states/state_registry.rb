require 'yaml'
require_relative 'state'

module Cod
  class StateRegistry
    class << self
      def all
        @all ||= load!
      end

      def [](key)
        all[key.to_sym]
      end

      def reload!
        @all = nil
        all
      end

      private

      def load!
        path = File.join(
          AresMUSH.root_path,
          'plugins',
          'cod',
          'states',
          'states.yml'
        )

        raw = YAML.load_file(path)
        raise "Missing 'states' root key" unless raw['states']

        states = {}

        raw['states'].each do |key, data|
          states[key.to_sym] = State.new(
            key: key,
            display_name: data['display_name'],
            allowed_templates: data['allowed_templates'],
            chargen_selectable: data['chargen_selectable'],
            staff_assignable: data['staff_assignable'],
            description: data['description']
          )
        end

        states.freeze
      end
    end
  end
end
