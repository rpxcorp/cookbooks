
#
#
#

plugins = [
  "chucknorris", "git", "rake", 
  "rubymetricfu", "sounds", "xunit",
  "jsunit", "ruby", "selenium-aes",
  "ec2", "rubyMetrics", "sloccount",
]

plugins.each do |i|
  hudson_plugin i
end
