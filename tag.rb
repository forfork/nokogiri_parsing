require 'rubygems'
require 'nokogiri'
require 'open-uri'

#파싱(parsing)할 페이지(예제 : 중앙일보)
PAGE_URL = "http://joongang.joins.com/"

#open-uri 와 nokogiri 를 이용해서 중앙일보 페이지를 파싱
page = Nokogiri::HTML(open(PAGE_URL))

#CSS - 단일 태그 파싱
title_tag = page.css('title') #<title> 태그를 파싱
puts title_tag.text #<title> 태그의 텍스트를 출력 - 즉 사이트의 제목