require "redis"

module RedisApp
  class Actions
    def test
      redis = self.connect
      puts "doing"
      redis.set("foo", "bar")
      test = redis.get("foo")
      return test
    end

    def metric_store(metric)
      redis = self.connect
      redis.set("key:#{metric.key}", metric.value)
      return "Success: #{redis.get("key:#{metric.key}")}"
    end

    def connect()
      host = ENV["REDIS_HOST"] ||= "localhost"
      Redis.new(host: host, port: 6379)
    end
  end
end
