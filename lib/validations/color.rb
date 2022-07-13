module Validations
  class Color

    WHITE = :white
    BLACK = :black

    # DON'T CHANGE POSITIONS HERE
    VALID_COLORS = [
      WHITE,
      BLACK
    ].freeze

    def self.update_color(color)
      return BLACK if color.to_sym == WHITE

      WHITE
    end
  end
end
