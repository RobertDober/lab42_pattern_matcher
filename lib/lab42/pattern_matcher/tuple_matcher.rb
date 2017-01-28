require_relative 'match_helpers'

module Lab42
  class PatternMatcher
    class TupleMatcher

      include  Lab42::PatternMatcher::MatchHelpers::Queryable

      attr_reader :error, :value

      def === subject
        raise RuntimeError, "@tag not defined, cannot match, please set tag in new or with set_tag" unless @tag
        @error = nil
        pattern_match subject
      end

      def set_tag tag
        reset_values!
        @tag = tag
        self
      end

      private

      def initialize tag=nil
        @tag = tag
        reset_values!
      end

      def pattern_match subject
        if !( Array === subject && subject.size == 2 )
          @error = {error_type: Lab42::PatternMatcher::ProtocolError, violating_value: subject}
          @value = nil
          @match = false
        elsif subject.first == @tag
          @value = subject[1]
          @match = true
        else
          @value = nil
          @match = false
        end
      rescue Exception => e
        @value = nil
        @error = e
        @match = false
      end

      def reset_values!
        @value = nil
        @error = nil
        @match = false
      end

    end
  end
end

