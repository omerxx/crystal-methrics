require "redis"

def test
  redis = Redis.new

  puts "doing"
  redis.set("foo", "bar")
  test = redis.get("foo")
  return test
end
