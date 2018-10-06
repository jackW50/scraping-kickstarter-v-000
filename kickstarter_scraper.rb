# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  #binding.pry 
  projects = {}
  kickstarter.css("li.project.grid_4").each do |p|
    new_hash = projects[p.css("h2.bbcard_name strong a").to_sym] = {}
    new_hash[:image_link] = p.css("div.project_thumbnail a img").attribute("src").value 
    new_hash[:description] = p.css("p.bbcard_blurb").text
    new_hash[:location] = p.css("ul.project-meta li span.location-name").text 
    new_hash[:percent_funded] = p.css("ul.project_stats li.first.funded strong").text.gsub("%", "").to_i 
  end 
  projects 
end

#projects = {} 



# projects: kickstarter.css("li.project.grid_4")
# projects each do |p|
    #title = p.css("h2.bbcard_name strong a")
    #image_link = p.css("div.project_thumbnail a img").attribute("src").value  
    #description = p.css("p.bbcard_blurb").text 
    #location = p.css("ul.project-meta li a span.location-name").text 
    #percent funded = p.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i
create_project_hash