#### Remove file from staging area

    git reset HEAD -- .

https://stackoverflow.com/questions/19730565/how-to-remove-files-from-git-staging-area

#### all tags in current branch (CLI - remote)

        krinata2@KRINATA2-M-QKVQ inode-service-manager % git tag
        local_inventory
        v1.0.0
        v1.0.1
        v1.1.0
        v1.1.1
        v2.0.0
        v2.0.3_2.2.2
        v2.0.3_2.3.3
        v2.1.0-dev
        v2.1.1_2.4.2

#### to find branch of given tag

        krinata2@KRINATA2-M-QKVQ inode-service-manager % git branch --contains tags/v2.0.3_2.2.2
        * master
        
#### How to build specific tag in jenkins

https://stackoverflow.com/questions/10195900/jenkins-git-plugin-how-to-build-specific-tag/22747145#22747145
