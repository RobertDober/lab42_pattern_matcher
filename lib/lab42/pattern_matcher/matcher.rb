module Lab42
  class PatternMatcher
    # I provide a match object that compares with ===
    module Matcher
      def match(*args)
        return __match__ if args.empty?
      end

      private

      def __match__
        @__match__ ||= Lab42::PatternMatcher.new
      end
    end
  end
end
