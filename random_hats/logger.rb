class Logger

  class << self
    def verbose!
      @level = :verbose
    end

    def regular!
      @level = nil
    end

    def regular(method, message)
      send(method, message)
    end

    def verbose(method, message)
      send(method, message) if @level == :verbose
    end
  end

end
