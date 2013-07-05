Dir["./lib/*.rb"].each {|file | require file }

stacky = Stacky.new

puts stacky.query ARGV.join(" ")