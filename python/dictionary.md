
1. Python says that the dictionary Keys should derive from the immutable data types. You can infer that only allowed types are **strings**, **numbers** or **tuples**. Check out a standard example below.

2. The same key can’t have another value in the dictionary. It confirms that a duplicate key can’t exist. However, even if you try to supply a duplicate key, it’ll only modify the existing key with the value provided in the last assignment.

Python doesn’t impose any constraints on the “Values” of a dictionary object. You can form them using the standard Python or any custom data types. But, as we said earlier, the “Keys” aren’t the same as “Values” and have altogether different handling.

## Membership test

    weekdays = {'fri': 5, 'tue': 2, 'wed': 3, 'sat': 6, 'thu': 4, 'mon': 1, 'sun': 0}
    
    print('fri' in weekdays)
    # Output: True
    
    print('thu' not in weekdays)
    # Output: False
    
    print('mon' in weekdays)
    # Output: True
    
## Dictionary Comprehension

    >>> {str(element):element for element in [11,22,33,44,55]}
    {'11': 11, '22': 22, '33': 33, '44': 44, '55': 55}
    
    >>> weekdays = ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
    >>> {w:len(w) for w in weekdays}
    {'sun': 3, 'mon': 3, 'tue': 3, 'wed': 3, 'thu': 3, 'fri': 3, 'sat': 3}
    
    >>> {w : i for i, w in enumerate(weekdays)}
    {'sun': 0, 'mon': 1, 'tue': 2, 'wed': 3, 'thu': 4, 'fri': 5, 'sat': 6}
    >>>
    
## Append / update in a Dictionary

#### Assignment to Append / update Elements

    >>> x={1:"one",2:"two"}
    >>> x[3]='three'
    >>> print(x)
    {1: 'one', 2: 'two', 3: 'three'}
    >>>
    >>> x[2]='TWO'
    >>> print(x)
    {1: 'one', 2: 'TWO', 3: 'three'}
    >>>

#### Update Method to Append / update Elements

    >>> x={1:"one",2:"two"}
    >>> x.update({3:"three"})
    >>> print(x)
    {1: 'one', 2: 'two', 3: 'three'}
    >>>
    >>> x.update({2:"TWO"})
    >>> print(x)
    {1: 'one', 2: 'TWO', 3: 'three'}
    >>>
    
## Remove Elements
 
#### Create a Python dictionary
    sixMonths = {1:31, 2:28, 3:31, 4:30, 5:31, 6:30}

#### Delete a specific element
    >>> print(sixMonths.pop(6))
    30
    >>> print(sixMonths)
    {1: 31, 2: 28, 3: 31, 4: 30, 5: 31}

#### Delete an random element
    >>> print(sixMonths.popitem())
    (5, 31)
    >>> print(sixMonths)
    {1: 31, 2: 28, 3: 31, 4: 30}

#### Remove a specific element
    >>> del sixMonths[4]
    >>> print(sixMonths)
    {1: 31, 2: 28, 3: 31}

#### Delete all elements from the dictionary
    >>> sixMonths.clear()
    >>> print(sixMonths)
    {}

#### Finally, eliminate the dictionary object
    >>> del sixMonths
    >>> print(sixMonths)
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    NameError: name 'sixMonths' is not defined
    >>>

## Iterate Dictionaries

#### iterate by keys

    >>> dict = {'Student Name': 'Berry', 'Roll No.': 12, 'Subject': 'English'}
    >>> for key in dict:
    ...     print(key)
    ...
    Student Name
    Roll No.
    Subject
    >>>
    >>>
    >>> for key in dict.keys():
    ...     print(key)
    ...
    Student Name
    Roll No.
    Subject
    >>>
    >>>

#### iterate by values

    >>> for values in dict.values():
    ...     print(values)
    ...
    Berry
    12
    English
    >>>

#### iterate by items

    >>> for key,value in dict.items():
    ...     print(key,":",values)
    ...
    Student Name : English
    Roll No. : English
    Subject : English
    >>>
    >>>
    >>>
    >>> for item in dict.items():
    ...     print(item[0],":",item[1])
    ...
    Student Name : Berry
    Roll No. : 12
    Subject : English
    >>>
