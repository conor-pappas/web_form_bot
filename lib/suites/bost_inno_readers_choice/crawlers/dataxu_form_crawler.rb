require_relative '../../../page_crawler'

module BostInnoReadersChoice
  class DataxuFormCrawler < PageCrawler
    CONTEST_URL = 'https://docs.google.com/forms/d/e/1FAIpQLSeJ5TZgt3HczVIdz4wdJ9m_iEGFUrM3shuDxMHVLCt8MznlDA/viewform'.freeze
    FORM_OPTIONS = ['YES!', 'Of course I did!', 'You know it!'].freeze
    CONTESTANT_NAME = 'Conor Pappas'.freeze

    def page_url
      CONTEST_URL
    end

    def crawl
      select_form_option(random_form_option)
      fill_name
      submit_form
    end

    def select_form_option(option_name)
      click_element(:css, "[data-value=\"#{option_name}\"]")
    end

    def fill_name
      browser.find_element(:css, '[aria-label="What is your name?"]').send_keys(CONTESTANT_NAME)
    end

    def submit_form
      click_element(:class, 'freebirdFormviewerViewNavigationSubmitButton')
    end

    def random_form_option
      FORM_OPTIONS.sample
    end

  end
end
