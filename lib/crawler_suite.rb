require_relative './web_driver'

class CrawlerSuite
  def crawlers
    raise 'unimplemented'
  end

  def run
    crawlers.each do |klass|
      klass.new(web_driver: driver).run
    end
  end

  def driver
    Thread.current[:web_driver] ||= WebDriver.new
  end
end
