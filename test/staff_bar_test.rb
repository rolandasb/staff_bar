require 'test_helper'

class StaffBar::Test < ActiveSupport::TestCase
  def setup
    Rails.application.config.action_controller.perform_caching = false
  end

  test "revision" do
    assert_equal "abcd123", StaffBar.revision
  end

  test "branch" do
    assert_equal "foo-branch", StaffBar.branch
  end

  test "rails_version" do
    assert_equal "6.0.0", StaffBar.rails_version
  end

  test "environment" do
    assert_equal "test", StaffBar.environment
  end

  test "time" do
    travel_to Time.zone.parse("2019-10-01 00:00:00") do
      assert_equal "2019-10-01 00:00:00 UTC", StaffBar.time
    end
  end

  test "time_zone" do
    assert_equal "Etc/UTC", StaffBar.time_zone
  end

  test "cache" do
    assert_equal "Caching disabled", StaffBar.cache

    Rails.application.config.action_controller.perform_caching = true
    assert_equal "Caching enabled", StaffBar.cache
  end

  test "cache_class" do
    assert_equal "", StaffBar.cache_class

    Rails.application.config.action_controller.perform_caching = true
    assert_equal "staff-bar-green", StaffBar.cache_class
  end

  test "position_class" do
    assert_equal "staff-bar-bottom", StaffBar.position_class

    StaffBar.config.position = :top
    assert_equal "staff-bar-top", StaffBar.position_class

    StaffBar.config.position = :foobar
    assert_equal "staff-bar-bottom", StaffBar.position_class
  end

  test "theme_class" do
    assert_equal "", StaffBar.theme_class

    StaffBar.config.theme = :light
    assert_equal "staff-bar-inverse", StaffBar.theme_class

    StaffBar.config.theme = :foobar
    assert_equal "", StaffBar.theme_class
  end
end
