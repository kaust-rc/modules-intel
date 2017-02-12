# KAUST SMC module files
Git would be an easy way to manage module files on KAUST clusters.

## Cloning
* Clone this repo to your home directory either on your laptop or smc cluster
  * `mkdir -p ~/git && cd ~/git && git clone https://gitlab.kaust.edu.sa/kaust-rc/modules-smc.git`

## Modify module files
* Create or modify any required file then do the following (You just need to modify -extra directories)
  * Lets say that you added `netcdf` to `libs-extra`
  * Don't forget to do a `git pull` to get latest updates

## Testing
The following testing steps works if you cloned the repo to your cluster home/scratch
  * Modify `KAUST_MODULES_ROOT` & `MODULEPATH` environment variables to match your repo
    * `KAUST_MODULES_ROOT=~/git/modules-smc`
    * `MODULEPATH=$KAUST_MODULES_ROOT/applications:$KAUST_MODULES_ROOT/compilers:$KAUST_MODULES_ROOT/libs:$KAUST_MODULES_ROOT/workstations`
  * If the tests passed successfully, commit and push your changes
  * `git commit -am "Adding netcdf libraries"`
  * `git push`

### You can add the following functions to your .bashrc file to make the switch easy
```bash
tmode(){
    if [[ ! $TEST_MODE ]];then

        #backup old variables
        OLD_KAUST_MODULES_ROOT=$KAUST_MODULES_ROOT;
        OLD_MODULEPATH=$MODULEPATH;
        OLD_PS1=$PS1;

        #setting new variables (change KAUST_MODULES_ROOT according to your cloned modules path and the used    cluster)
        HOSTNAME=$(hostname -s)
        case "$HOSTNAME" in
            'noor-login2' | 'noor-login3' | 'rcfen05' | 'rcfen06')
                echo "Noor 1 cluster modules are not managed by git."
                exit 1
                ;;
            'rcfen01' | 'rcfen02' | 'da01' | 'ca128' )
                KAUST_MODULES_ROOT=~/git/modules-noor2;
                ;;
            'rcfen03' | 'rcfen04' | 'ci426' | 'ci427' )
                KAUST_MODULES_ROOT=~/git/modules-smc;
                ;;
            *)
                echo "Couldn't determine development node!"
                exit 1
        esac

        MODULEPATH=$KAUST_MODULES_ROOT/applications:$KAUST_MODULES_ROOT/compilers:$KAUST_MODULES_ROOT/libs:$KAUST_MODULES_ROOT/workstations:$KAUST_MODULES_ROOT/sets;
        PS1="$PS1\[\033[38;5;9m\]\[test mode\]\[$(tput sgr0)\] > ";
        TEST_MODE=1;
    else
        echo "You are using the test mode!"
    fi
}
pmode(){
    #
    if [[ $TEST_MODE ]]; then

        KAUST_MODULES_ROOT=$OLD_KAUST_MODULES_ROOT;
        MODULEPATH=$OLD_MODULEPATH;
        PS1=$OLD_PS1;

        #removing old variables
        unset OLD_KAUST_MODULES_ROOT OLD_MODULEPATH OLD_PS1 TEST_MODE;
    else
        echo "You are using the production mode!"
    fi
}
```
