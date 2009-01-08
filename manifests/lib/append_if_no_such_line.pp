# A simple define to examine a file and add the given line to that file,                
# unless the line already exists somewhere in the file.                                 
#                                                                                       
# Similar in concept to the CFEngine editfiles command of the same name.                
                                                                                        
define append_if_no_such_line($file, $line) {                                           
  exec { "/bin/echo '$line' >> $file":                                                  
    unless => "/bin/grep -xF \"$line\" $file"                                           
  }                                                                                     
}
