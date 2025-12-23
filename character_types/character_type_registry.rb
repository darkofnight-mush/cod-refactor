require 'yaml'
require_relative 'character_type'

module Cod
  class CharacterTypeRegistry
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
          'character_types',
          'character_types.yml'
        )

        raw = YAML.load_file(path)
        raise "Missing 'character_types' root key" unless raw['character_types']

        types = {}

        raw['character_types'].each do |key, data|
          types[key.to_sym] = CharacterType.new(
            key: key,
            display_name: data['display_name'],
            base_template: data['base_template'],
            states: data['states'] || [],
            description: data['description']
          )
        end

        types.freeze
      end
    end
  end
end
