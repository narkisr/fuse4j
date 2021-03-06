# not detectable?
DEPFLAGS='-D_FILE_OFFSET_BITS=64'
LDFLAGS='-ljvm -lfuse -lpthread'
FUSE_HOME = '/usr'
JAVA_HOME = '/usr/lib/jvm/java-6-sun'

INCLUDES = "-I#{JAVA_HOME}/include -I#{JAVA_HOME}/include/linux -I#{FUSE_HOME}/include/fuse"
CFLAGS = "-Wall -g -fPIC #{DEPFLAGS}"
server_path = (`uname -a`.include?("i686") && "i386") || "amd64"
LDPATH = "-L#{FUSE_HOME}/lib -L#{JAVA_HOME}/jre/lib/#{server_path}/server"
