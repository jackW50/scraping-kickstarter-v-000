# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  binding.pry 
end

# projects: kickstarter.css("li.project.grid_4")
# projects each do |p|
    #title = p.css("h2.bbcard_name strong a")
    #image_link = p.css("div.project_thumbnail a img").attribute("src").value  
    #description = p.css("p.bbcard_blurb").text 
    
create_project_hash