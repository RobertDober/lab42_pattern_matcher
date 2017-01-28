# Lab42::PatternMatcher Demo

### Using the Tuple Matcher on the `[:ok, _]`, `[:error, _]` protocol.


```ruby
    module M extend self

      def match_on_ok value
        match = Lab42::PatternMatcher::TupleMatcher.new
        case value
        when match.ok?
          match.value
        when match.error?
          "ERR: #{match.value}"
        else
          :no_match
        end
      end

    end

    M.match_on_ok([:ok, 42]).assert == 42
    M.match_on_ok([:error, 40]).assert == "ERR: 40"
    M.match_on_ok([]).assert == :no_match
```

Sometimes we would like to access values that violate the protocol

```ruby
    
    module M extend self

      def match_on_ok value
        match = Lab42::PatternMatcher::TupleMatcher.new
        case value
        when match.ok?
          match.value
        when match.error?
          "ERR: #{match.value}"
        else
          match.error
        end
      end

    end

    M.match_on_ok("hello").assert == {error_type: Lab42::PatternMatcher::ProtocolError, violating_value: "hello"}
```

