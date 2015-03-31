require 'mechanize'
require 'pmap'

YEARS = (2010..2015).to_a
MONTHS= (1..12).to_a
URL = 'http://www.kemendag.go.id/id/economic-profile/prices/national-price-table'
TODAY = Date.today

# Parser
def parse_price_list_page(page)
  statistik = page.at('table.statistik')

  head_rows = statistik./('thead>tr')
  dates = head_rows[1]./('th').map{|cell| cell.text.to_i}

  body_rows = statistik./('tbody>tr')

  body_rows.map do |row|
    cells = row./('td').map{|cell| cell.text}
    name  = cells[1]
    unit  = cells[2]
    prices= cells[3..-1].map{|cell| cell.delete('^0-9').to_i}
    prices = Hash[dates.zip(prices)]
    {name: name, unit: unit, prices: prices}
  end
end

# Parallel scraper
YEARS.peach do |year| # peach: 'parallel each' from pmap gem
  MONTHS.peach do |month|
  	
  	queried_date = Date.new(year, month, 28)
    if queried_date < TODAY and queried_date > Date.new(2010,9)
      data = {year: year, month: month}
      
      m = Mechanize.new
      page = m.get(URL, data)
      parsed = parse_price_list_page(page)
      json_of_parsed = JSON.pretty_generate(parsed)
      File.write("D:\\Cembako\\datasets\\kemendag\\#{year}-#{month}.json", json_of_parsed)
    end
  end
end
