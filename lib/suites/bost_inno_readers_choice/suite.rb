require_relative '../../crawler_suite'
require_relative './crawlers/contest_crawler'
require_relative './crawlers/dataxu_form_crawler'

module BostInnoReadersChoice
  class Suite < CrawlerSuite

    def crawlers
      [ContestCrawler, DataxuFormCrawler]
    end
  end
end
