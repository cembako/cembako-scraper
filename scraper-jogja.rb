require 'mechanize'
# require 'pmap'

YEARS = (2010..2015).to_a
MONTHS= (1..12).to_a
URL = 'http://disperindagkop.jogjaprov.go.id/statistik_sembako.html'

# Parser
def parse_price_list_page(page)
  statistik = page./('div>table').last

  labels, *body_rows = statistik./('tr')
  dates=labels./('td')[3..-1].map{|i| i.text.to_i}

 body_rows.map do |row|
    cells = row./('td').map{|cell| cell.text}
    name  = cells[1]
    unit  = cells[2]
    prices= cells[3..-1].map{|cell| cell.delete('^0-9').to_i}
    prices = Hash[dates.zip(prices)]
    {name: name, unit: unit, prices: prices}
  end
end

#
m = Mechanize.new
page=m.get(URL)
parsed = parse_price_list_page(page)
json_of_parsed = JSON.generate(parsed)
year=2015
month=2
File.write("D:\\Cembako\\datasets\\jogja\\#{year}-#{month}.json", json_of_parsed)

# # Parallel scraper
# YEARS.peach do |year| # peach: 'parallel each' from pmap gem
#   MONTHS.peach do |month|
#     p "#{year} #{month}"
#     data = {year: year, month: month}
#     # page = m.get(URL, data)
#     # parse_price_list_page(page)
#   end
# end
