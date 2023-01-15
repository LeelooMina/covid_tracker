require_relative "country.rb"

class State < Country



end

Missouri = State.new("Missouri", "10", "0", "10")

puts State.all[0].name
