require 'date'

module Tor
  module Addresses
    class Record
      def initialize(line)
        @line = line
      end

      def address
        line_fragments[1]
      end

      def found_at
        datetime_fragments = line_fragments[2, 3]
        datetime_str = datetime_fragments.join(' ')

        DateTime.parse(datetime_str)
      end

      private

      def line_fragments
        @line_fragments ||= line.split
      end

      attr_reader :line
    end
  end
end
