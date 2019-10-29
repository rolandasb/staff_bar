# frozen_string_literal: true

module StaffBar
  class << self
    def revision
      if File.exist?(File.join(Rails.root, "REVISION"))
        file = File.join(Rails.root, "REVISION")
        File.read(file).chomp.first(7)
      elsif File.exist?(File.join(Rails.root, ".git"))
        `git rev-parse --short HEAD`.chomp
      end
    end

    def branch
      if File.exist?(File.join(Rails.root, "BRANCH"))
        file = File.join(Rails.root, "BRANCH")
        File.read(file).chomp
      elsif File.exist?(File.join(Rails.root, ".git"))
        `git rev-parse --abbrev-ref HEAD`.chomp
      end
    end

    def ruby_version
      RUBY_VERSION
    end

    def rails_version
      Rails.version
    end

    def environment
      Rails.env
    end

    def time
      Time.current.to_s
    end

    def time_zone
      Time.zone.tzinfo.identifier
    end

    def cache
      cache_enabled? ? "Caching enabled" : "Caching disabled"
    end

    def cache_class
      cache_enabled? ? "staff-bar-green" : ""
    end

    def position_class
      StaffBar.config.position == :top ? "staff-bar-top" : "staff-bar-bottom"
    end

    def theme_class
      StaffBar.config.theme == :light ? "staff-bar-inverse" : ""
    end

    private
      def cache_enabled?
        Rails.application.config.action_controller.perform_caching
      end
  end
end
