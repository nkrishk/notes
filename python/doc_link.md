
## Dictinoary

  https://python.plainenglish.io/python-programming-tutorial-dictionary-1f966191ca03
  
#### sorting (loop and lambda function)

  https://www.geeksforgeeks.org/python-sort-dictionary-key-and-values-list/
    
    
## List

#### List unpacking

  https://www.pythontutorial.net/python-basics/python-unpack-list/
  
  
## string
  
#### Print Without Newline in Python 3.x

Printing without a new line is simple in Python 3. In order to print without newline in Python, you need to add an extra argument to your print function that will tell the program that you don’t want your next string to be on a new line.

Here’s an example:

    print("Hello there!", end = '')
    print("It is a great day.")

The output for our code is:

    Hello there!It is a great day.
    
    
## cycle 

#### from itertools import cycle - infinite loop

    from itertools import cycle
    for i in cycle(m):
        print(i)


## Diffrent ways of string reversal

#### builtin reversed method

    >>> s="string"
    >>> r=''.join(reversed(s))
    >>> print(r)
    gnirts
    >>>
    
#### using for loop

LOOP1: element loop, start to end

    >>> s="string"
    >>> r=''
    >>> for each in s:
    ...     r = each + r
    ...
    >>> print(r)
    gnirts
    >>>
    
LOOP2: index loop start to end
 
    >>> s="string"
    >>> r=''
    >>> for i in range(len(s)-1,-1,-1):
    ...     r = r + s[i]
    ...
    >>> print(r)
    gnirts
    >>>
 
#### using slicing
 
    >>> s="string"
    >>> r=s[::-1]
    >>> r
    'gnirts'
    >>>


