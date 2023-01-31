platfom OS?? PYTHONPATH

python regex?

what is a self in python class?

common data types? list operation

## LIST

5 points

**star triangle**

input = 9

            *
           ***
          *****
         *******
        *********
       ***********
      *************
     ***************
    *****************

input = 3

      *
     ***
    *****

Very basic:
5 points

given a list, find if a element is present or not 
given a dict, find if a value is present or not
given a dict, find if a key is present or not
then using iterator

## DICT

5 points

Python program to combine two dictionary by adding values for common keys
    d1 = {'a': 100, 'b': 200, 'c':300}
    d2 = {'a': 300, 'b': 200, 'd':400}
    Sample output: Counter({'a': 400, 'b': 400, 'd': 400, 'c': 300})

5 points

Start with loops
1. create a list with elements from 1 to 4
2. 5-100 in steps of 5


5 points

a list [1,2,5,2,1,4,8,9,3,2]
find the number of times an element occurs

expectation to use dictionary: hash approach
if using loop also fine (-1)

# animals list
    animals = ['cat', 'dog', 'rabbit', 'guinea pig']
    animals.remove('rabbit')
    print('Updated animals list: ', animals)


# animals list
    animals = ['cat', 'dog', 'dog', 'guinea pig', 'dog']
    animals.remove('dog')
    print('Updated animals list: ', animals)

# create a list of prime numbers
    prime_numbers = [2, 3, 5, 7]
    removed_element = prime_numbers.pop(2)
    print('Removed Element:', removed_element)
    print('Updated List:', prime_numbers)

# create a list
    prime_numbers = [2, 3, 5]
    numbers = [1, 4]
    numbers.extend(prime_numbers)

# Suppose
    list1=[2, 33, 222, 14, 25]
    list1[-1]

## Try catch

    def divide(a,b):
        result = a/b
        return result
    print(divide(10,2))
    print(divide(5,1))
    print(divide(5,0))
    print(divide(1,10))
    print(divide(0,5))

## module import

    import numpy as np
    arr = np.array([1, 2, 3, 4, 5])
    print(arr)
    print(type(arr))

## function scope

    a=2
    def add():
        a=1
        b=3
        c=a+b
        print(c)
    add()
    print(a)

## deep copy shallow copy

    def f(l):
        l.append(4)
    l=[1,2,3]
    s=l
    f(s)
    print(l)
    print(s)


## class

    class X:
        def __init__(self):
            self.__num1 = 5
            self.num2 = 2

        def display_values(self):
            print(self.__num1, self.num2)
    class Y(X):
        def __init__(self):
            super().__init__()
            self.__num1 = 1
            self.num2 = 6
    obj = Y()
    obj.display_values()




##### Problem solving

10 points

    sorting element in python:
    program to sort element in python
    
10 points

    You are given two string arrays creators and ids, and an integer array views, all of length n. 
    The ith video on a platform was created by creator[i], has an id of ids[i], and has views[i] views.

    The popularity of a creator is the sum of the number of views on all of the creator's videos. 
    1.Find the creator with the highest popularity
    2.For the highest popular person, find the id of video with highest views

5 points

easy

https://leetcode.com/problems/average-value-of-even-numbers-that-are-divisible-by-three/
https://leetcode.com/problems/first-letter-to-appear-twice/

    class Solution:
        def repeatedCharacter(self, s: str) -> str:
            dicta={}
            for i in s:
                if i in dicta:
                    return i
                else:
                    dicta[i]=1
    class Solution:
        def repeatedCharacter(self, s: str) -> str:
            for i in range(1,len(s)):
                if s[i] in s[0:i]:
                    return(s[i])
                
medium:
