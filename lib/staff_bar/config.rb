# frozen_string_literal: true

module StaffBar
  class << self
    def configure
      yield config
    end

    def config
      @_config ||= Config.new
    end
  end

  class Config
    attr_accessor :links, :theme, :position, :highlight_envs

    def initialize
      @links = []
      @theme = :dark
      @position = :bottom
      @highlight_envs = [:production]
    end
  end
end
