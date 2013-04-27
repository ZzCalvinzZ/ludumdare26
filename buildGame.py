#!/usr/bin/env python

import fnmatch
import os
import time
import sys
from subprocess import call
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
from watchdog.events import FileSystemEvent

rootPath = 'ludumdare26'
pattern = '*.coffee'

class Updater(FileSystemEventHandler):

    def on_any_event(self, event):

        if event.src_path.endswith('.js'):
            return

        print ''
        print 'Change detected. Updating dependencies..'
        print ''
        print 'Compiling coffeescript files...'
        for root, dirs, files in os.walk(rootPath):
            for filename in fnmatch.filter(files, pattern):
                print( os.path.join(root, filename))
                call( [ 'coffee', '-c', os.path.join(root, filename) ] )

        print 'Updating all closure dependencies...'
        print os.path.join(os.getcwd(), 'bin/limejs.py')
        call([ 'bin/lime.py', 'update' ])

        print ''
        print ''
        print 'Watching local directory for changes...'

if __name__ == "__main__":

    Updater().on_any_event(FileSystemEvent('', ''))

    if len(sys.argv) > 1 and sys.argv[1] == 'build':
        sys.exit(0)

    event_handler = Updater()
    observer = Observer()
    observer.schedule(event_handler, path=rootPath, recursive=True)
    observer.start()
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()


