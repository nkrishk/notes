# cpp

### power , exponential

https://www.quora.com/How-do-I-write-10-9-in-C-programming

  You asked about “10” to the ninth, but Gary’s response begins with a “1” instead of a “10.” Yet Gary’s response is correct. Why?
  
  It’s because the “E” means “times ten to the power,” so 1e9 means:
  
  1 times 10 to the power 9.

    1e9 == 1000000000 (9 zeros)
    10e9 = 1000000000 (same 9 zeros)

### bitwise operator &
https://stackoverflow.com/questions/42815421/why-bitwise-operators-require-parentheses

**operator precedence,** the equality operator has higher precedence than the bitwise operators hence the need for parentheses

https://en.cppreference.com/w/cpp/language/operator_precedence
```cpp
int x = 4;
 if ( (x & 1) == 0 ) {  // => if(x & 1 == 0) wrong ```==``` evaluvated first before ```&```
  cout<<"even";
}
```

