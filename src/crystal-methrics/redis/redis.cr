require "redis"

module RedisApp
  class Actions
    def test
      redis = self.connect
      redis.rpush "metrics", "Something"
    end

    def metric_store(metric)
      redis = self.connect
      redis.rpush("metrics", "#{metric.key} #{metric.value}")
    end

    def connect
      host = ENV["REDIS_HOST"] ||= "localhost"
      puts "Redis host: #{host}"
      Redis.new(host: host, port: 6379)
    end
  end
end
