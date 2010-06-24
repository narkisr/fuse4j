# Compilation flags

os_matchers = { 
	:ubuntu=> lambda{|uname| uname.include?('Ubuntu') }
}

uname = `uname -a`
match,matcher =  os_matchers.find{|k,m| m.call(uname)}
require "rake-flags/#{match.to_s}"

