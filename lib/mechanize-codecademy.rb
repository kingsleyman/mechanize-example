require 'mechanize'

agent = Mechanize.new

all_courses = []

ruby_page = agent.get('https://www.codeschool.com/paths/ruby')
ruby_course = ruby_page.search(".courses .bucket-content a")

ruby_course.each do |a|
  url = a.attr('href') unless a.attr('href') == '#'
  title = a.at_css('b').text if a.at_css('b')
  description = a.at_css('.course-desc').text if a.at_css('.course-desc')

  all_courses.push({title: title, url: "https://www.codeschool.com" + url.to_s, description: description, provider: "CodeSchool", category: "Ruby"})
end

# ruby_course.each do |course_element|
#   all_courses.push({title: course_element.text, url: "https://www.codeschool.com" + ruby_href.value, provider: "CodeSchool", category: "Ruby"})
# end

# javascript_page = agent.get('https://www.codeschool.com/paths/javascript')
# javascript_element = javascript_page.search(".course-name b")

# javascript_element.each do |course_element|
#   all_courses.push({title: course_element.text, provider: "CodeSchool", category: "Javascript"})
# end

# html_css_page = agent.get('https://www.codeschool.com/paths/html-css')
# html_css_element = html_css_page.search(".course-name b")

# puts html_css_element.text

# ios_page = agent.get('https://www.codeschool.com/paths/ios')
# ios_element = ios_page.search(".course-name b")

# puts ios_element.text

puts all_courses
