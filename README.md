# KAUST SMC module files
Git would be an easy way to manage module files on KAUST clusters.

## Cloning
* Clone this repo to your home directory either on your laptop or smc cluster
  * `mkdir ~/git && cd ~/git && git clone https://gitlab.kaust.edu.sa/kaust-rc/modules-smc.git`

## Modify module files
* Create or modify any required file then do the following
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
testmod(){
    #backup old variables
    OLD_KAUST_MODULES_ROOT=$KAUST_MODULES_ROOT;
    OLD_MODULEPATH=$MODULEPATH;

    #setting new variables (change KAUST_MODULES_ROOT according to your cloned modules path)
    KAUST_MODULES_ROOT=~/git/modules-smc;
    MODULEPATH=$KAUST_MODULES_ROOT/applications:$KAUST_MODULES_ROOT/compilers:$KAUST_MODULES_ROOT/libs:$KAUST_MODULES_ROOT/workstations;
}
prodmod(){
    KAUST_MODULES_ROOT=$OLD_KAUST_MODULES_ROOT;
    MODULEPATH=$OLD_MODULEPATH;

    #removing old variables
    unset OLD_KAUST_MODULES_ROOT OLD_MODULEPATH;
}
```
