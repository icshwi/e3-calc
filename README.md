# e3-calc


We enable the following two modules as default:

* SSCAN  for the swait record
* SNCSEQ for editSseq.st

```
make init
make rebuild
```


## EPICS community build
If one would like to use FSL as CC, make patch is the mandatory step. 
```
make init
make patch
make epics
make epics-clean
```