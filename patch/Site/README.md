# Site Specific EPICS Module Patch Files

## Changes
The changes were tested in local environemnt, and commits to the forked repository and do pull request to the epics community module repository.

* Check the original HASH, and your own master
* feb8856 : The original HASH
* master : Changed


## How to create a p0 patch file between commits


* Show what the difference between commits

```
jhlee@kaffee: calc-dev (master)$ git diff feb8856 master --no-prefix
diff --git configure/RELEASE configure/RELEASE
index 642415d..7b8a206 100644
--- configure/RELEASE
+++ configure/RELEASE
@@ -23,3 +23,8 @@ EPICS_BASE=/home/oxygen/MOONEY/epics/bazaar/base-3.14
 #Capfast users may need the following definitions
 #CAPFAST_TEMPLATES=
 #SCH2EDIF_PATH=
+
+
+# The definitions shown below can also be placed in an untracked RELEASE.local
+-include $(TOP)/../RELEASE.local
+-include $(TOP)/configure/RELEASE.local
diff --git tests/Makefile tests/Makefile
index 7230c2d..e06cf81 100644
--- tests/Makefile
+++ tests/Makefile
@@ -21,6 +21,14 @@ calcTestHarness_SRCS += $(testHarness_SRCS)
 TESTSPEC_vxWorks = calcTestHarness.munch; runTests
 
 PROD_LIBS += calc
+
+ifdef SSCAN
+PROD_LIBS += sscan
+endif
+ifdef SNCSEQ
+PROD_LIBS += seq
+endif
+
 PROD_LIBS += $(EPICS_BASE_IOC_LIBS)
 
 TESTSCRIPTS_HOST += $(TESTS:%=%.t)
```


* Create p0 patch

```
jhlee@kaffee: calc-dev (master)$ git diff feb8856 master --no-prefix > ../patch/Site/cc_linking_release_local.p0.patch
```


* Update HISTORY.md in ../patch/Site directory

```
# cc_linking_release_local.p0.patch

fsl linux cross compile failure, discussed through github pullrequests

* created by Jeong Han Lee, han.lee@esss.se
* https://github.com/epics-modules/calc/pull/17
* Tuesday, February 13 10:51:19 CET 2018

```


## How to apply the created patch to epics-base

Makefile apply patch files according to its base version.
