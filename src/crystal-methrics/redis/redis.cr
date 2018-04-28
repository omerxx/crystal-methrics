require "redis"

redis = Redis.new

puts "doing"
redis.set("foo", "bar")
test = redis.get("foo")
puts test
