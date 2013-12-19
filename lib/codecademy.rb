require 'mechanize'

agent = Mechanize.new

all_courses = []

ruby_page = agent.get('http://www.codecademy.com/learn')
ruby_course = ruby_page.search(".curricula__gallery a")

ruby_course.each do |a|
  url = a.attr('href') unless a.attr('href') == '#'
  title = a.at_css('.ui-card__title').text.strip if a.at_css('.ui-card__title')
  description = a.at_css('.curricula__item__description').text.strip if a.at_css('.curricula__item__description')

  
  all_courses.push({
  		title: title, 
  		category: title,
  		url: "http://www.codecademy.com" + url.to_s, 
  		description: description, 
  		})
end

('text()').to_s

# require 'mechanize'

# agent = Mechanize.new

# all_courses = []

# ruby_page = agent.get('http://www.codecademy.com/learn')
# ruby_course = ruby_page.search(".curricula__item a")

# ruby_course.each do |a|
#   url = a.attr('href') unless a.attr('href') == '#'
#   title = a.at_css('.ui-card__title').text if a.at_css('.ui-card__title')
#   description = a.at_css('.curricula__item__description').text if a.at_css('.curricula__item__description')

#   all_courses.push(
#   	{
#   		title: title, 
#   		category: title, 
#   		url: "http://www.codecademy.com" + url.to_s, 
#   		description: description, 
#   		provider: "Codecademy",})
# end

puts all_courses
