require 'yaml'
require_relative 'stat'
require_relative 'stat_category'

module Cod
  class StatRegistry
    class << self
      def all
        @all ||= load!
      end

      def [](key)
        all[key.to_sym]
      end

      private

      def load!
        base = File.join(
          AresMUSH.root_path,
          'plugins',
          'cod',
          'stats',
          'stats_data'
        )

        categories = {}

        Dir["#{base}/*.yml"].each do |file|
          raw = YAML.load_file(file)
          stats = {}

          raw['stats'].each do |stat_key, stat_name|
            stats[stat_key.to_sym] = Stat.new(
              key: stat_key,
              name: stat_name,
              category: raw['key']
            )
          end

          categories[raw['key'].to_sym] = StatCategory.new(
            key: raw['key'],
            name: raw['name'],
            stats: stats
          )
        end

        categories.freeze
      end
    end
  end
end
