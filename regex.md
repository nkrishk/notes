# Regex


#### Python

https://stackoverflow.com/questions/587345/regular-expression-matching-a-multiline-block-of-text

Prefer to use this for new line 

     [\r\n]{2}

Try this:

    re.compile(r"^(.+)\n((?:\n.+)+)", re.MULTILINE)
I think your biggest problem is that you're expecting the ^ and $ anchors to match linefeeds, but they don't. In multiline mode, ^ matches the position immediately following a newline and $ matches the position immediately preceding a newline.

Be aware, too, that a newline can consist of a linefeed (\n), a carriage-return (\r), or a carriage-return+linefeed (\r\n). If you aren't certain that your target text uses only linefeeds, you should use this more inclusive version of the regex:

    re.compile(r"^(.+)(?:\n|\r\n?)((?:(?:\n|\r\n?).+)+)", re.MULTILINE)
    
    # Error in packet.
    # Reason: notWritable (That object does not support modification)
    # Failed object: iso.3.6.1.4.1.9.9.117.1.2.1.1.2.50001
    p3 = re.compile(r'Error in packet.[\r\n]+Reason:\s(?P<error>.+)[\r\n]+Failed object:\s(iso|1)(?P<oid>[.\d]+)', re.MULTILINE)

BTW, you don't want to use the DOTALL modifier here; you're relying on the fact that the dot matches everything except newlines.


https://stackoverflow.com/questions/4544636/what-does-s-s-mean-in-regex-in-php

By default ```.``` doesn't match new lines - ```[\s\S]``` is a hack around that problem.
