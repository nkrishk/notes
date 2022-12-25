https://stackoverflow.com/questions/16414559/how-to-use-hex-without-0x-in-python


(Recommended)
Python 3 f-strings: 

    >>> i = 3735928559
    >>> f'{i:x}'
    'deadbeef'
    
Alternatives:
format builtin function (good for single values only)

    >>> format(3735928559, 'x')
    'deadbeef'
    
And sometimes we still may need to use str.format formatting in certain situations @Eumiro
(Though I would still recommend f-strings in most situations)

    >>> '{:x}'.format(3735928559)
    'deadbeef'
    
(Legacy) f-strings should solve all of your needs, but printf-style formatting is what we used to do @msvalkon

    >>> '%x' % 3735928559
    'deadbeef'
    
Without string formatting @jsbueno

    >>> i = 3735928559
    >>> i.to_bytes(4, "big").hex()
    'deadbeef'
    
Hacky Answers (avoid)
hex(i)[2:] @GuillaumeLemaître

    >>> i = 3735928559
    >>> hex(i)[2:]
    'deadbeef'
    
This relies on string slicing instead of using a function / method made specifically for formatting as hex. This is why it may give unexpected output for negative numbers:

    >>> i = -3735928559
    >>> hex(i)[2:]
    'xdeadbeef'
    >>> f'{i:x}'
    '-deadbeef'
