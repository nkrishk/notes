

## grep print few line above or below the matching line

```
grep -C2 'pattern' /path/to/file

# displays the two lines before and after a match

-C2 After and Before the pattern print 2 lines
-A2 After the pattern print 2 lines
-B3 Before pattern print 3 lines
```
