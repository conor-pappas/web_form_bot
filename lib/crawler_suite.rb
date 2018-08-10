require_relative './web_driver'

class CrawlerSuite
  def crawlers
    raise 'unimplemented'
  end

  def run
    driver = WebDriver.new
    crawlers.each do |klass|
      klass.new(web_driver: driver).run
    end
  end
end
