#!/usr/bin/python3
#import os
import cgi
import subprocess

print("content-type: text/html")
print()

data = cgi.FieldStorage()
mydata = data.getvalue("x")
output = subprocess.getoutput("sudo docker run -i " + mydata )
print(output)
