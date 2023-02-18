The Cisco commit process states each GitHub merge request should contain only a single commit.  This should be checked prior to issuing the "git push origin ..." command.  In the event that you find your workspace contains multiple commits, the commits must be squashed into a single commit using the instructions below.  Squashing multiple commits to a single commit facilitates code reviews and minimizes unnecessary extraneous commit entries in the origin repository.



The first step when squashing commits is to identify the number of commits that require squashing.  To do this, use the "git log --oneline ..." command.  Identify the commit that your workspace branch is based upon, and note it's git hash code.  In the example below, the workspace was pulled based on the polaris_dev label "BLD_POLARIS_DEV_S2C_20230208_033853".  In other cases, your workspace may be based on the HEAD of a branch, such as the CABU special branch "(HEAD -> CSCxx12345.v179_1_cabu, origin/spl_cco/v179_1_cabu)".

        git log --oneline -4
 
        cba8fae5f4b5 (HEAD -> CSCxx12345.polaris_dev) Fix the build and copyrights
        22cf9cb04fbf CSCxx12345 Feature XYZ changes in IOSd-CLC
        846a046f228e CSCxx12345 Feature XYZ cdman code changes
        25cc1a89bffc (tag: BLD_POLARIS_DEV_S2C_20230208_033853, origin/s2c/polaris_dev) CSCwe18035 Bender: Enable Queue Backpressure (QBP) for crypto events


Using the git log output, start the interactive rebase session by selecting the number of commits to include in the rebase.  There are several methods to do this. 

Count the number of local commits in your workspace and run the interactive git rebase command using the "HEAD~#" method
Identify the root commit your workspace is based on and specify it alone.  This will automatically include all commits up to and including the HEAD commit
Specify a range of commits using the start and end hash codes

        git rebase -i HEAD~3
        git rebase -i 25cc1a89bffc
        git rebase -i 25cc1a89bffc cba8fae5f4b5


This will begin the interactive rebase session.  Git will open an editor and show you the list of commits being rebased.  Each commit is shown in order from the top down, from oldest to newest commit.  The file also contains excellent instructions for other powerful actions that can be used with the git rebase command.  We will be using only the squash command here.

        pick 846a046f228e CSCxx12345 Feature XYZ cdman code changes
        pick 22cf9cb04fbf CSCxx12345 Feature XYZ changes in IOSd-CLC
        pick cba8fae5f4b5 Fix the build and copyrights

        # Rebase 25cc1a89bffc..cba8fae5f4b5 onto 25cc1a89bffc (3 commands)
        #
        # Commands:
        # p, pick <commit> = use commit
        # r, reword <commit> = use commit, but edit the commit message
        # e, edit <commit> = use commit, but stop for amending
        # s, squash <commit> = use commit, but meld into previous commit
        # f, fixup [-C | -c] <commit> = like "squash" but keep only the previous
        #                    commit's log message, unless -C is used, in which case
        #                    keep only this commit's message; -c is same as -C but
        #                    opens the editor
        # x, exec <command> = run command (the rest of the line) using shell
        # b, break = stop here (continue rebase later with 'git rebase --continue')
        # d, drop <commit> = remove commit
        # l, label <label> = label current HEAD with a name
        # t, reset <label> = reset HEAD to a label
        # m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
        # .       create a merge commit using the original merge commit's
        # .       message (or the oneline, if no original merge commit was
        # .       specified); use -c <commit> to reword the commit message
        #
        # These lines can be re-ordered; they are executed from top to bottom.
        #
        # If you remove a line here THAT COMMIT WILL BE LOST.
        #
        # However, if you remove everything, the rebase will be aborted.
        #


To squash your commits to a single commit, you will need to pick the first commit, then squash the subsequent commits.  Manually change the word 'pick' on lines 2 and 3 in order to accomplish the squash.

NOTE: In the event something goes wrong and you need to abort this process, delete all the pick lines so the file contains only comments.  Save and exit.  Git will make no changes to your branch.

        pick 846a046f228e CSCxx12345 Feature XYZ cdman code changes
        squash 22cf9cb04fbf CSCxx12345 Feature XYZ changes in IOSd-CLC
        squash cba8fae5f4b5 Fix the build and copyrights

        # Rebase 25cc1a89bffc..cba8fae5f4b5 onto 25cc1a89bffc (3 commands)
        #
        # Commands:
        # p, pick <commit> = use commit
        # r, reword <commit> = use commit, but edit the commit message
        # e, edit <commit> = use commit, but stop for amending
        # s, squash <commit> = use commit, but meld into previous commit
        # f, fixup [-C | -c] <commit> = like "squash" but keep only the previous
        #                    commit's log message, unless -C is used, in which case
        #                    keep only this commit's message; -c is same as -C but
        #                    opens the editor
        # x, exec <command> = run command (the rest of the line) using shell
        # b, break = stop here (continue rebase later with 'git rebase --continue')
        # d, drop <commit> = remove commit
        # l, label <label> = label current HEAD with a name
        # t, reset <label> = reset HEAD to a label
        # m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
        # .       create a merge commit using the original merge commit's
        # .       message (or the oneline, if no original merge commit was
        # .       specified); use -c <commit> to reword the commit message
        #
        # These lines can be re-ordered; they are executed from top to bottom.
        #
        # If you remove a line here THAT COMMIT WILL BE LOST.
        #
        # However, if you remove everything, the rebase will be aborted.
        #


Save the editor and exit.  Git will start rebasing and open a second editor.  The editor now contains the list of commit messages that existed for each of the original commits.  You should edit these comments to make a single coherent commit comment that will describe the one commit.

        # This is a combination of 3 commits.
        # This is the 1st commit message:

        CSCxx12345 Feature XYZ cdman code changes

        # This is the commit message #2:

        CSCxx12345 Feature XYZ changes in IOSd-CLC

        # This is the commit message #3:

        Fix the build and copyrights

        # Please enter the commit message for your changes. Lines starting
        # with '#' will be ignored, and an empty message aborts the commit.
        #
        # Date:      Fri Feb 10 00:44:08 2023 -0500
        #
        # interactive rebase in progress; onto 25cc1a89bffc
        # Last commands done (3 commands done):
        #    squash 22cf9cb04fbf CSCxx12345 Feature XYZ changes in IOSd-CLC
        #    squash cba8fae5f4b5 Fix the build and copyrights
        # No commands remaining.
        # You are currently rebasing.
        #
        # Changes to be committed:
        #   modified:   binos/cable/cdman/module/ubr-infra/dcm/src/dcm_utils.c
        #   modified:   vob/ios/sys/src-ubr/ubr-infra/dcm/src/ubr_dcm_clc.c
        #   modified:   vob/ios/sys/src-ubr/ubr-infra/dcm/src/ubr_dcm_parser_chain.c
        #
        Modified ...

        CSCxx12345 Feature XYZ code changes in CDMAN and IOSd-CLC

        # Please enter the commit message for your changes. Lines starting
        # with '#' will be ignored, and an empty message aborts the commit.
        #
        # Date:      Fri Feb 10 00:44:08 2023 -0500
        #
        # interactive rebase in progress; onto 25cc1a89bffc
        # Last commands done (3 commands done):
        #    squash 22cf9cb04fbf CSCxx12345 Feature XYZ changes in IOSd-CLC
        #    squash cba8fae5f4b5 Fix the build and copyrights
        # No commands remaining.
        # You are currently rebasing.
        #
        # Changes to be committed:
        #   modified:   binos/cable/cdman/module/ubr-infra/dcm/src/dcm_utils.c
        #   modified:   vob/ios/sys/src-ubr/ubr-infra/dcm/src/ubr_dcm_clc.c
        #   modified:   vob/ios/sys/src-ubr/ubr-infra/dcm/src/ubr_dcm_parser_chain.c
        #


Save and exit the editor.  Review the git log output to confirm the squash is complete.

        git log --oneline -2

        5ec2cb927313 (HEAD) CSCxx12345 Feature XYZ code changes in CDMAN and IOSd-CLC
        25cc1a89bffc (tag: BLD_POLARIS_DEV_S2C_20230208_033853, origin/s2c/polaris_dev) CSCwe18035 Bender: Enable Queue Backpressure (QBP) for crypto events


The workspace now contains a single commit (5ec2cb927313) and is ready to be pushed to begin a merge request.
