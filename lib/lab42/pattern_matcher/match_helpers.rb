module Lab42
  class PatternMatcher
    module MatchHelpers
      module Queryable
        def method_missing(name, *args)
          is_query = %r{\?\z}
          case name.to_s
          when is_query
            set_tag(name.to_s.sub(is_query, "").to_sym)
          else
            super
          end
        end
      end
    end
  end
end
