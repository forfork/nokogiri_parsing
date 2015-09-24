require 'rubygems'
require 'nokogiri'
require 'open-uri'

#파싱(parsing)할 페이지(예제 : 중앙일보)
PAGE_URL = "http://joongang.joins.com/"

#open-uri 와 nokogiri 를 이용해서 중앙일보 페이지를 파싱
page = Nokogiri::HTML(open(PAGE_URL))

#CSS - 복수 파싱
link_tags = page.css('a') #여러 개의 a 태그가 담김
link_tags.each do |link|
    puts "텍스트 : " + link.text
    #href 가 없는 a 태그도 있기 때문에 to_s 로 nil 값 에러 방지
    puts "주소 : " + link['href'].to_s
end