require 'selenium-webdriver'
require_relative './web_driver'

class PageCrawler
  WAIT_TIMEOUT = 2

  def initialize(web_driver: nil)
    @web_driver = web_driver || WebDriver.new
  end

  def browser
    @web_driver.selenium_driver
  end

  def page_url
    raise 'unimplemented'
  end

  def run
    browser.navigate.to page_url
    crawl
  end

  def crawl
    raise 'unimplemented'
  end

  def wait_util_element
    wait.until do
      element = yield
      element if element.displayed?
    end
  end

  def safe_find_element(how, what)
    wait_util_element { browser.find_element(how, what) }
  end

  def wait
    @wait ||= Selenium::WebDriver::Wait.new(:timeout => WAIT_TIMEOUT)
  end

  def click_element(how, what)
    browser.find_element(how, what).click
  end

  def safe_click_element(how, what)
    safe_find_element(how, what).click
  end
end
