require 'nokogiri'
require 'open-uri'

base_url = 'https://ja.wiktionary.org/'
page_url = 'wiki/%E3%82%AB%E3%83%86%E3%82%B4%E3%83%AA:%E6%97%A5%E6%9C%AC%E8%AA%9E_%E5%BD%A2%E5%AE%B9%E5%8B%95%E8%A9%9E'
charset = 'utf-8'

adjective_verb = Array.new

loop do
  html = open(base_url + page_url){ |f| f.read }
  doc = Nokogiri::HTML.parse(html, nil, charset)
  word_list = doc.xpath("//div[@class='mw-category']/div[@class='mw-category-group']/ul/li/a/text()")
  word_list.each do |w| adjective_verb << w end
  puts page_url
  break if doc.xpath("//*[@id='mw-pages']/a[2]/@href").to_s.include?('until')
  page_url = doc.xpath("//*[@id='mw-pages']/a[2]/@href").to_s
  # puts word_list
end
puts adjective_verb



base_url = 'https://ja.wiktionary.org/'
page_url = 'wiki/%E3%82%AB%E3%83%86%E3%82%B4%E3%83%AA:%E6%97%A5%E6%9C%AC%E8%AA%9E_%E5%90%8D%E8%A9%9E'
charset = 'utf-8'

noun_word = Array.new

loop do
  html = open(base_url + page_url){ |f| f.read }
  doc = Nokogiri::HTML.parse(html, nil, charset)
  word_list = doc.xpath("//div[@class='mw-category']/div[@class='mw-category-group']/ul/li/a/text()")
  word_list.each do |w| noun_word << w end
  puts page_url
  break if doc.xpath("//*[@id='mw-pages']/a[2]/@href").to_s.include?('until')
  page_url = doc.xpath("//*[@id='mw-pages']/a[2]/@href").to_s
  # puts word_list
end

puts adjective_verb



