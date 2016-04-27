# KAUST SMC module files
Git would be an easy way to manage module files on KAUST clusters.

## Usage
* Clone this repo to your home directory either on your laptop or smc cluster
.* `cd && git clone https://gitlab.kaust.edu.sa/kaust-rc/modules-smc.git`
* Create or modify any required file then do the following.
.* Lets say that you added `netcdf` to `libs-extra`
.* `git add libs-extra/netcdf`
.* `git commit -m "Adding netcdf libraries"`
.* `git push`
