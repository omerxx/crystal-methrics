require "redis"

def test
  redis = Redis.new

  puts "doing"
  redis.set("foo", "bar")
  test = redis.get("foo")
  return test
end

def metric_store(metrics)
  redis = Redis.new
  redis.set("user:#{metrics["metric_id"]}", metrics["key_id"])
  return redis.get("user:#{metrics["metric_id"]}")
end
