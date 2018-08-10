require_relative '../../../page_crawler'

module BostInnoReadersChoice
  class ContestCrawler < PageCrawler
    CONTEST_URL = 'http://bit.ly/2zCIVHt'.freeze

    def page_url
      CONTEST_URL
    end

    def crawl
      start_form
      choose_dataxu
      submit_form
    end

    def start_form
      browser.find_element(:tag_name, 'button').send_keys(:enter)
    end

    def choose_dataxu
      input = safe_find_element(:tag_name, 'input')
      input.send_keys('DataXu')
      input.send_keys(:enter)
    end

    def submit_form
      safe_click_element(:class, 'stkv-qa-submit_btn')
    end

  end
end
