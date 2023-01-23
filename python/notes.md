
#### pydoc

  https://python-forum.io/thread-21201.html
  
    --- /usr/lib/python3.6/pydoc.py.orig    2019-09-18 18:18:03.214625729 -0500
    +++ /usr/lib/python3.6/pydoc.py 2019-09-18 19:27:06.761990792 -0500
    @@ -2550,7 +2550,7 @@
         raise TypeError('unknown content type %r for url %s' % (content_type, url))


    -def browse(port=0, *, open_browser=True):
    +def browse(port=0, *, open_browser=True, allow_detach=False):
         """Start the enhanced pydoc Web server and open a Web browser.

         Use port '0' to start the server on an arbitrary port.
    @@ -2561,6 +2561,8 @@
         if serverthread.error:
             print(serverthread.error)
             return
    +    if allow_detach == True and open_browser == False:
    +        return
         if serverthread.serving:
             server_help_msg = 'Server commands: [b]rowser, [q]uit'
             if open_browser:
    @@ -2604,10 +2606,11 @@
             sys.path.insert(0, '.')

         try:
    -        opts, args = getopt.getopt(sys.argv[1:], 'bk:p:w')
    +        opts, args = getopt.getopt(sys.argv[1:], 'bdk:p:w')
             writing = False
             start_server = False
             open_browser = False
    +        allow_detach = False
             port = None
             for opt, val in opts:
                 if opt == '-b':
    @@ -2621,11 +2624,13 @@
                     port = val
                 if opt == '-w':
                     writing = True
    +            if opt == '-d':
    +                allow_detach = True

             if start_server:
                 if port is None:
                     port = 0
    -            browse(port, open_browser=open_browser)
    +            browse(port, open_browser=open_browser, allow_detach=allow_detach)
                 return

             if not args: raise BadUsage
    @@ -2670,6 +2675,11 @@
         to interactively browse documentation.  The -p option can be used with
         the -b option to explicitly specify the server port.

    +{cmd} -d
    +    Start the HTTP server but don't prompt for browser or attempt to start
    +    one unless the -b option is specified. Allows backgrounding of 
    +    documentation server in a shell scripting context.
    +
     {cmd} -w <name> ...
         Write out the HTML documentation for a module to a file in the current
       directory.  If <name> contains a '{sep}', it is treated as a filename; if
