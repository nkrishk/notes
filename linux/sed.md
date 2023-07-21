#### list line numbers from x to y

https://stackoverflow.com/questions/83329/how-can-i-extract-a-predetermined-range-of-lines-from-a-text-file-on-unix


## sed specific lines

```sed -n '16224,16482p;16483q' filename > newfile```

```
;   seperator between commands
p   print line (range of lines cam be printed using , eg 5,8p prints line number 5,6,7,8 )
q   quit from that line - see explanation below , useful for large files

To do this on a VERY large file, it helps if you add a quit command on the next line. Then it's sed -n '16224,16482p;16483q' filename. Otherwise sed will keep scanning till the end (or at least my version does)
```

## sed for a patterm

```sed -n '/the_pattern/p' /path/to/files/*```
