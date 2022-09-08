require 'selenium-webdriver'
require 'test-unit'
#require 'report_builder'
require 'logger'

class GoogleTest < MiniTest::Test
  def setup
    @driver = Selenium::WebDriver.default
    $log = Logger.new("my_log.txt")
  end

  def test_post
    @driver.navigate.to "http://www.google.com"
    element = @driver.find_element(:name, 'q')
    element.send_keys "TestingBot"
    element.submit
    assert_equal(@driver.title, "TestingBot - Google Search")
    rescue => exception
        # if test fails
        $log.error("Test Failed - Method test_post:"+ exception.message)
        raise exception
    else
        # if test passes
        $log.info("Test Passed - Method test_post: Search")
    end
  end

  def teardown
    @driver.quit
  end
end