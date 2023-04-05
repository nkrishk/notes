
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
    
## Iterate Dictionaries

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
    >>> for values in dict.values():
    ...     print(values)
    ...
    Berry
    12
    English
    >>>
    >>>
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
