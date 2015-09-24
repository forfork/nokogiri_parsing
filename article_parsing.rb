require 'rubygems'
require 'nokogiri'
require 'open-uri'

#파싱(parsing)할 페이지(예제 : 중앙일보)
PAGE_URL = "http://joongang.joins.com/"

#open-uri 와 nokogiri 를 이용해서 중앙일보 페이지를 파싱
page = Nokogiri::HTML(open(PAGE_URL))
#div.main_article
#파싱한 페이지 내에서 main_article 이라는 class 를 가진 태그에 접근.
#li a
#그리고 자식들 중 li 태그 또 그 자식들 중에 a 태그에 접근
articles = page.css('.main_article li a')
#제목을 담을 배열을 생성
titles = []

#each 문으로 articles 에 대해서 반복문을 실행
articles.each do |article|
    #각자의 article 마다 text 를 뽑아내어 titles 배열에 저장시킴
    titles.push article.text
end

#그 후 puts 를 이용해서 출력
puts titles