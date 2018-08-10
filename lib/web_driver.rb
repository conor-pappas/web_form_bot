class WebDriver
  DEFAULT_BROWSER = :firefox

  ## FIXME we should just have subclasses for browsers instead of passing in
  attr_accessor :browser
  def initialize(browser: nil)
    @browser = browser || DEFAULT_BROWSER
  end

  def selenium_driver
    @selenium_driver ||= Selenium::WebDriver.for(browser, options: options)
  end

  def options
    options = Selenium::WebDriver::Firefox::Options.new
    options.add_argument('--headless')
    options.profile = profile
    options
  end

  def profile
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile["permissions.default.image"] = 2
    profile
  end
end
