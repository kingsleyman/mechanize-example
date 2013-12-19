require 'rubygems'
require 'mechanize'

agent = Mechanize.new

all_courses = []
all_links = []

js_page = agent.get('http://www.codecademy.com/learn')
js_element = js_page.search(".ui-card__title")
js_element_a = js_page.search(".curricula__item__panel")
js_element_url = js_element_a.attr('href')

# js_element_a.each do |a|
#   all_links.push(a.attr('href').text)
# end

# js_page.links_with(:class => 'ui-card--solo').each do|link|
#   puts link.text
# end

js_page_links = Array.new
#maybe you better use 'h3.r > a.l' here
js_page.parser.css('a.ui-card--solo').each do |l|
#page.parser here is Nokogiri::HTML::Document
  js_page_links << l
  test = puts "http://www.codecademy.com" +  l["href"]
  puts l
  all_links.push({link: test.to_s, provider: "Codecademy"})

end
puts js_page_links.size


js_element.each do |course_element|
  all_courses.push({title: course_element.text, provider: "Codecademy"})
end

puts
puts all_links
puts all_courses


# js_links = js_page.search('.curricula__940-container')

# js_a = js_page.search('.curricula__item')
# js_a2 = js_a.search('.ui-card')
# js_a3 = js_a2.search('.ui-card--solo')
# js_href = js_a3.attr('href')

# test = js_page.link_with(:dom_class => ".ui-card--solo")

# js_url = js_a.attr('href')


# js_page.js_links.each do|link|
#   puts js_link.text
# end

# js_element_a.links.each do |link|
# all_links.push({link: link.text})
# end


# puts "href attributes"
# puts js_href
# puts test


# puts
# puts
# puts all_links
# puts agent.page.link_with(:class => ".curricula__item__panel")
