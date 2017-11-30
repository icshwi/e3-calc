#
#  Copyright (c) 2017 - Present  European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
# Author  : Jeong Han Lee
# email   : han.lee@esss.se
# Date    : Wednesday, November 29 13:46:39 CET 2017
# version : 0.0.1


where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(REQUIRE_TOOLS)/driver.makefile

APP:=calcApp
APPDB:=$(APP)/Db
APPSRC:=$(APP)/src


USR_INCLUDES += -I$(where_am_I)/$(APPSRC)

#TEMPLATES += $(wildcard $(APPDB)/*.template)


USR_CFLAGS   += -Wno-unused-variable
USR_CFLAGS   += -Wno-unused-function
USR_CFLAGS   += -Wno-unused-but-set-variable
USR_CPPFLAGS += -Wno-unused-variable
USR_CPPFLAGS += -Wno-unused-function
USR_CPPFLAGS += -Wno-unused-but-set-variable


HEADERS += $(APPSRC)/sCalcPostfix.h
HEADERS += $(APPSRC)/aCalcPostfix.h
HEADERS += swaitRecord.h
HEADERS += sseqRecord.h
HEADERS += aCalcoutRecord.h
HEADERS += sCalcoutRecord.h
HEADERS += transformRecord.h


SOURCES += $(APPSRC)/sCalcPostfix.c
SOURCES += $(APPSRC)/sCalcPerform.c
SOURCES += $(APPSRC)/aCalcPostfix.c
SOURCES += $(APPSRC)/aCalcPerform.c

SOURCES += $(APPSRC)/calcUtil.c
SOURCES += $(APPSRC)/myFreeListLib.c
SOURCES += $(APPSRC)/devsCalcoutSoft.c
SOURCES += $(APPSRC)/devaCalcoutSoft.c
SOURCES += $(APPSRC)/subAve.c
SOURCES += $(APPSRC)/switRecord.c
SOURCES += $(APPSRC)/editSseq.st
SOURCES += $(APPSRC)/interp.c
SOURCES += $(APPSRC)/arrayTest.c
SOURCES += $(APPSRC)/aCalcMonitorMem.c

SOURCES += $(APPSRC)/swaitRecord.c
SOURCES += $(APPSRC)/sseqRecord.c
SOURCES += $(APPSRC)/aCalcoutRecord.c
SOURCES += $(APPSRC)/sCalcoutRecord.c
SOURCES += $(APPSRC)/transformRecord.c


DBDS += $(APPSRC)/calcSupport.dbd
# DBDS += $(APPSRC)/sscanProgressSupport.dbd
# Warning: skipping duplicate file menuSscan.dbd from command line
# DBDS += $(APPSRC)/menuSscan.dbd

vpath %.dbd   $(where_am_I)/$(APPSRC)


transformRecord$(DEP): swaitRecord.h sseqRecord.h aCalcoutRecord.h sCalcoutRecord.h transformRecord.h

USR_DBDFLAGS += -I . -I ..

%.h: %.dbd
	$(DBTORECORDTYPEH)  $(USR_DBDFLAGS) -o $@ $<


#menuSscan.h: menuSscan.dbd
#	$(DBTOMENUH) $(USR_DBDFLAGS) -o $@ $<





#TEMPLATES += $(wildcard $(APPDB)/*.db)
#TEMPLATES += $(wildcard $(APPDB)/*.template)
#TEMPLATES += $(wildcard $(APPDB)/*.substitutions)


