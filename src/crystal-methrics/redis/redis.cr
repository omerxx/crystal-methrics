require "redis"

module RedisApp
  class Actions
    def test
      redis = Redis.new

      puts "doing"
      redis.set("foo", "bar")
      test = redis.get("foo")
      return test
    end

    def metric_store(metric)
      redis = Redis.new
      redis.set("key:#{metric.key}", metric.value)
      return "Success: #{redis.get("key:#{metric.key}")}"
    end
  end
end
