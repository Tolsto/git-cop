# frozen_string_literal: true

module Git
  module Cop
    module Reporters
      module Lines
        class Paragraph
          def initialize data = {}
            @data = data
          end

          def to_s
            %(#{label}"#{paragraph}"\n)
          end

          private

          attr_reader :data

          def label
            "#{Line::DEFAULT_INDENT}Line #{number}: "
          end

          def paragraph
            formatted_lines.join "\n"
          end

          def formatted_lines
            content.split("\n").map.with_index do |line, index|
              index.zero? ? line : "#{indent}#{line}"
            end
          end

          def indent
            " " * (label.length + 1)
          end

          def number
            data.fetch :number
          end

          def content
            data.fetch :content
          end
        end
      end
    end
  end
end
