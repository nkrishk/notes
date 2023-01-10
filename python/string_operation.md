

#### split string of equal width

useful in case of ip or mac splitting

https://stackoverflow.com/questions/9475241/split-string-every-nth-character

#### bash rc for extra character on executing command in automation

This seem to work as a workaround:

    echo "set enable-bracketed-paste off" > .inputrc
    export INPUTRC=$PWD/.inputrc

i added a below and it helped

    echo "set enable-bracketed-paste off" > ~/.inputrc
    export INPUTRC=~/.inputrc

https://github.com/pexpect/pexpect/issues/669
