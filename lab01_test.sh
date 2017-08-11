
                #!/bin/bash
                echo 'Warning: This script will switch the branch of your git to master!'

                # Switch to master branch
                git checkout master >/dev/null 2>&1 ;

                # Testing if python file runs correctly
                python3 *.py >/dev/null
                rc=$?;
                if [[ $rc != 0 ]]; then
                    echo 'Python script not working';
                    exit $rc;
                fi


                branches=`git branch`;

                # Check available branches
                if ! [[ `echo $branches | egrep 'master\b'` ]]; then
                    echo 'Have you created branch master yet?';
                    exit 1;
                fi

                if ! [[ `echo $branches | egrep '\bdev\b'` ]]; then
                    echo 'Have you created branch dev yet?';
                    exit 1;
                fi

                # Check merge
                git checkout master >/dev/null 2>&1 ;
                hash=`git log | head -1 | cut -d' ' -f 2`;
                git checkout dev >/dev/null 2>&1 ;

                if [[ `git log | egrep $hash` ]]; then
                    echo 'dev is synced with master';
                else
                    echo 'dev is not synced with master yet';
                    exit 1;
                fi

                # Check if there's actually merge conflicts
                if ! [[ `git log --merges` ]]; then
                    echo 'Have you created a merge conflict and resolved it?';
                    exit 1;
                fi

                echo 'All tests passed! You are awesome!';
            
