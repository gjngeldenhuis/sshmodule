# validate_number
module Puppet::Parser::Functions
  newfunction(:validate_number) do |args|
    if (args.size != 1) then
      raise(Puppet::ParseError, "is_numeric(): Wrong number of argumentss "+
        "given #{args.size} for 1")
    end

    value = args[0]

    if ! (value == value.to_f.to_s or value == value.to_i.to_s) then
      raise(Puppet::ParseError, "The value #{args[0].inspect} is not numeric")
    end

  end
end
