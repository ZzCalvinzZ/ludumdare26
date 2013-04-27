#!/usr/bin/env python

import fnmatch
import os
from subprocess import call
 
rootPath = 'ludumdare26'
pattern = '*.coffee'
 
print 'Compiling coffeescript files...'
for root, dirs, files in os.walk(rootPath):
    for filename in fnmatch.filter(files, pattern):
        print( os.path.join(root, filename))
        call( [ 'coffee', '-c', os.path.join(root, filename) ] )

print 'Updating all closure dependencies...'
print os.path.join(os.getcwd(), 'bin/limejs.py')
call([ 'bin/lime.py', 'update' ])
