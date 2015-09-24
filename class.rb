require 'rubygems'
require 'nokogiri'
require 'open-uri'

#파싱(parsing)할 페이지(예제 : 중앙일보)
PAGE_URL = "http://joongang.joins.com/"

#open-uri 와 nokogiri 를 이용해서 중앙일보 페이지를 파싱
page = Nokogiri::HTML(open(PAGE_URL))

#Class 파싱
main_articles = page.css('.main_article') #중앙일보 사이트의 주요 기사들을 모아놓은 영역
puts main_articles