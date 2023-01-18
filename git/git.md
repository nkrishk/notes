#### revert after push

    git reset --hard 0d5111d92a796544c64f2ddf2a1120b8e48df763
    
    git commit -am "reverting AuthUtil.java chages"
    
    git push -f
    
```git commit -a``` means almost[\*] the same thing as ```git add -u && git commit```.

[\*] There's a subtle difference if you're not at the root directory of your repository. ```git add -u``` stages updates to files in the current directory and below, it's equivalent to ```git add -u .``` whereas ```git commit -a``` stages and commits changes to all tracked files.

https://stackoverflow.com/questions/3541647/git-add-vs-git-commit-a

#### git add usage [ git add . ] [git add -A ] [ git add -u ]

https://www.geeksforgeeks.org/difference-between-add-a-add-u-add-and-add/

#### Remove file from staging area (it will not be deleted)

    git reset HEAD -- .

https://stackoverflow.com/questions/19730565/how-to-remove-files-from-git-staging-area

#### all tags in repo  (CLI - remote)

        krinata2@KRINATA2-M-QKVQ inode-service-manager % git tag
        local_inventory
        v1.0.0
        v1.0.1
        v1.1.0

#### to find branch of given tag (incorrect - it only prints current branch)

        krinata2@KRINATA2-M-QKVQ inode-service-manager % git branch --contains tags/v2.0.3_2.2.2
        * master
        
#### How to build specific tag in jenkins

https://stackoverflow.com/questions/10195900/jenkins-git-plugin-how-to-build-specific-tag/22747145#22747145

#### Tag help

https://devconnected.com/how-to-checkout-git-tags/

#### git delete branch - local and remote

Much informative - [stackoverflow](https://stackoverflow.com/questions/2003505/how-do-i-delete-a-git-branch-locally-and-remotely)

https://www.git-tower.com/learn/git/faq/delete-remote-branch

Local

    git branch -d feature/login
    
Remote

    git push origin --delete feature/login
