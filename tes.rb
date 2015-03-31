require 'mechanize'

URL =  'http://ews.kemendag.go.id/'

m =  Mechanize.new
page =  m.get(URL)
# Parser
raw_propinsis    = page./('#container > div > div.content.propinsi.fl-left > ul > li')
raw_nasional     = page.at('#container > div > div.content.nasional.fl-left > table')
# raw_internasional= page./('#container > div > div.content.internasional.fl-left > table')

date_1=page.at('#domestik-header > span:nth-child(2)').text
date_2=page.at('#domestik-header > span:nth-child(3)').text

propinsis =  raw_propinsis.map do |propinsi|
  location = propinsi./('.city span').text.strip
  raw_rows = propinsi./('tbody>tr')

  rows = raw_rows.map do |row|
    name   = row./('td')[0].text.strip
    price_1= row./('td')[1].text.delete('^0-9').to_i
    price_2= row./('td')[2].text.delete('^0-9').to_i
    prices={date_1=> price_1, date_2=> price_2}
    {'name'=> name, 'prices'=>prices}
  end

  {location: location, rows: rows}
end

# p propinsis

# p json_propinsis=JSON.pretty_generate(propinsis)
p JSON.generate(propinsis)

# nasional=raw_nasional

# returnee={propinsis: propinsis, nasional: nasional}

# p '---'
# p json_returnee=JSON.pretty_generate(returnee)

# raw_propinsis[0]./('tbody>tr')[0]./('td')[0].text.strip

#domestik-header > span:nth-child(2)
