module AresMUSH
  module Cod
    class SheetCmd
      include CommandHandler

      def handle
        char = enactor
        output = []

        Cod::StatRegistry.all.values.each do |category|
          output << "%xh#{category.name}%xn"

          category.stats.values.each do |stat|
            value = char.cod_stats&.dig(stat.category, stat.key) || 0
            output << format("%-20s %s", stat.name, value)
          end
        end

        client.emit BorderedDisplay.text(
          "#{char.name}'s Sheet",
          output.join("\n")
        )
      end
    end
  end
end
