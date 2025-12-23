module AresMUSH
  module Cod
    class SheetSetCmd
      include CommandHandler

      attr_accessor :stat, :value

      def parse_args
        self.stat, self.value = cmd.args.split('=', 2)
        self.value = value.to_i
      end

      def handle
        category = Cod::StatRegistry.all.values.find do |c|
          c.stats.key?(stat.to_sym)
        end

        return client.emit_failure("Unknown stat.") unless category

        enactor.cod_stats ||= {}
        enactor.cod_stats[category.key] ||= {}
        enactor.cod_stats[category.key][stat.to_sym] = value

        client.emit_success("#{stat} set to #{value}.")
      end
    end
  end
end
