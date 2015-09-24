#Nokogiri 로 웹페이지 파싱하기

노코기리(nokogiri)란 ruby 의 gem 중 하나로 웹 페이지를 파싱하는데 주로 쓰입니다.

### 노코기리 시작하기

```ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'

#파싱(parsing)할 페이지(예제 : 중앙일보)
PAGE_URL = "http://joongang.joins.com/"

#open-uri 와 nokogiri 를 이용해서 중앙일보 페이지를 파싱
page = Nokogiri::HTML(open(PAGE_URL))
puts page.class   # => Nokogiri::HTML::Document 가 나오면 정상
```

### tag 로 파싱하기
```ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'

#파싱(parsing)할 페이지(예제 : 중앙일보)
PAGE_URL = "http://joongang.joins.com/"

#open-uri 와 nokogiri 를 이용해서 중앙일보 페이지를 파싱
page = Nokogiri::HTML(open(PAGE_URL))

#CSS - 단일 태그 파싱
title_tag = page.css('title') #<title> 태그를 파싱
puts title_tag.text #<title> 태그의 텍스트(사이트의 제목)를 출력 > '중앙일보' 가 나오면 정상
```
`<title>` 태그의 내용을 파싱하는 코드입니다.

### id 로 파싱하기
```ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'

#파싱(parsing)할 페이지(예제 : 중앙일보)
PAGE_URL = "http://joongang.joins.com/"

#open-uri 와 nokogiri 를 이용해서 중앙일보 페이지를 파싱
page = Nokogiri::HTML(open(PAGE_URL))

#id 파싱
doc = page.css('#doc') #id가 doc 인 영역(중앙 일보 사이트 거의 전체)
puts doc
```
`doc` 이라는 id 를 가진 영역을 파싱하는 코드입니다.

### class 로 파싱하기
```ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'

#파싱(parsing)할 페이지(예제 : 중앙일보)
PAGE_URL = "http://joongang.joins.com/"

#open-uri 와 nokogiri 를 이용해서 중앙일보 페이지를 파싱
page = Nokogiri::HTML(open(PAGE_URL))

#Class 파싱
main_articles = page.css('.main_article') #중앙일보 사이트의 주요 기사들을 모아놓은 영역
puts main_articles # => 수많은 HTML 태그와 텍스트들이 섞여서 나오면 정상
```

`main_article` 이라는 클래스를 가진 영역을 파싱하는 코드입니다.

### 태그 파싱 - 복수
```ruby
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
```
사이트 내의 모든 a 태그를 파싱하고, 태그의 텍스트와 href 속성을 출력하는 코드입니다.

### 중앙일보 주요 기사 파싱하기
```ruby
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
```
중앙일보의 `main_article` 영역의 li 태그 안의 a 태그를 전부 파싱하고 그 후 a 태그의 텍스트(기사의 제목)을 출력하는 코드입니다.

### 과제

마지막으로 수행한 `중앙일보 주요 기사 파싱하기` 를 이용. **기사의 본문 내용을 파싱해오기.**  
- 힌트
 - 주요 기사들의 링크를 또다시 nokogiri 로 이용하기
