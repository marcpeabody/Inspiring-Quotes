require 'rss/2.0'
require 'open-uri'
require 'colorize'

@color = (String.colors[1..7] + String.colors[10..15]).sample # excluding 8 white and 9 default
@col   = ARGV.last || 50

def print_quote(quote, author)
  puts "#{quote}\n\t\t-#{author}".gsub(/(.{1,#{@col}})( +|$\n?)|(.{1,#{@col}})/, "\\1\\3\n").colorize(@color)
end

source = "http://www.quotedb.com/quote/quote.php?action=random_quote_rss&=&=&" # url or local file
rss = RSS::Parser.parse(open(source), false)

print_quote(rss.channel.item.description, rss.channel.item.title)
