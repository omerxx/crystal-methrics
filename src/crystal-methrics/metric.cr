module Data
  class Metric
    @key : String
    getter :key

    def initialize(@key : String)
    end
  end

  class Point < Metric
    @value : Int32
    getter :value

    def initialize(@key : String, @value : Int32)
    end
  end
end


