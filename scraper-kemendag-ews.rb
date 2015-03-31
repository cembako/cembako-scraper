require 'mechanize'
require 'pmap'

URL = 'http://ews.kemendag.go.id/'
TODAY = Date.today

# Parser
def parse_price_list_page(page)
  # @TODO
end

m = Mechanize.new