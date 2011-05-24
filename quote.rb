require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'
require 'colorize'

#Defines Function for word wraping
def wrap_text(txt, col = 80)
  txt.gsub(/(.{1,#{col}})( +|$\n?)|(.{1,#{col}})/, "\\1\\3\n") 
end

#Obtain rss feed of randome quote
source = "http://www.quotedb.com/quote/quote.php?action=random_quote_rss&=&=&" # url or local file
content = "" # raw content of rss feed will be loaded here
open(source) do |s| content = s.read end
rss = RSS::Parser.parse(content, false)

#Pick a randome color to output with
posible_colors = [1,2,3,4,5,6,10,11,12,13,14,15]
color = String.colors[posible_colors[rand(posible_colors.size)]]

#Extract Data fromat and output...Any questions
quote = wrap_text(rss.channel.item.description.colorize(color), 50)
author = wrap_text("\n\t\t-#{rss.channel.item.title}".colorize(color), 50)

#Print the lines
puts quote
puts author
