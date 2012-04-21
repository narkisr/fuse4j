
JAR = 'fuse4j-linux-native-2.4.0.jar'
NATIVE = 'native/linux/x86_64/'

directory NATIVE 

file 'native/linux/x86_64/libjavafs.so' => [:build, NATIVE] do
  cp 'libjavafs.so' , 'native/linux/x86_64/'
end

file 'native/linux/x86_64/javafs' => [:build, NATIVE] do
  cp 'javafs' , 'native/linux/x86_64/'
end

file JAR do
   sh "jar -cMf #{JAR} native" 
end

task :package => ['native/linux/x86_64/javafs', 'native/linux/x86_64/libjavafs.so',JAR] 


desc "publish jar to clojars"
task :publish => [:package] do
 sh "scp pom.xml #{JAR}  clojars@clojars.org:"	
end

CLEAN.include(JAR, 'native')
