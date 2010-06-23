# Compilation flags

# not detectable?
DEPFLAGS='-D_FILE_OFFSET_BITS=64'
LDFLAGS='-ljvm -lfuse -lpthread'
FUSE_HOME = '/usr'
JAVA_HOME = '/usr/lib/jvm/java-6-sun'

os_matchers = { 
	:Ubuntu_amd64=> lambda{|uname| uname.include?('Ubuntu') && uname.include?('64')} , 
	:Ubuntu_i386 => lambda{|uname| uname.include?('Ubuntu') && uname.include?('386')}
}

uname = `uname -a`
match,matcher =  os_matchers.find{|k,m| m.call(uname)}
# generated
server_path = match.to_s.sub('Ubuntu_','')
INCLUDES = "-I#{JAVA_HOME}/include -I#{JAVA_HOME}/include/linux -I#{FUSE_HOME}/include/fuse"
CFLAGS = "-Wall -g -fPIC #{DEPFLAGS}"
LDPATH = "-L#{FUSE_HOME}/lib -L#{JAVA_HOME}/jre/lib/#{server_path}/server"
