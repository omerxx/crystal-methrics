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
  redis.set("key:#{metrics["key_id"]}", metrics["metric_id"])
  return "Sucsses: #{redis.get("key:#{metrics["key_id"]}")}"
end
