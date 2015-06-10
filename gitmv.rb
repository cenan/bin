#!/usr/bin/env ruby

Dir.glob("*.hogan") do |file|
  `git mv #{file} #{File.basename(file, ".hogan")}.hbs`
end

