LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

REL_PATH:= ../..
ABS_PATH:= $(LOCAL_PATH)/$(REL_PATH)

LOCAL_SRC_FILES := \
	$(ABS_PATH)/src/fccharset.c \
	$(ABS_PATH)/src/fcformat.c \
	$(ABS_PATH)/src/fclist.c \
	$(ABS_PATH)/src/fcpat.c \
	$(ABS_PATH)/src/fcweight.c \
	$(ABS_PATH)/src/fcatomic.c \
	$(ABS_PATH)/src/fccompat.c \
	$(ABS_PATH)/src/fcfreetype.c \
	$(ABS_PATH)/src/fcmatch.c \
	$(ABS_PATH)/src/fcrange.c \
	$(ABS_PATH)/src/fcxml.c \
	$(ABS_PATH)/src/fcblanks.c \
	$(ABS_PATH)/src/fcdbg.c \
	$(ABS_PATH)/src/fcfs.c \
	$(ABS_PATH)/src/fcmatrix.c \
	$(ABS_PATH)/src/fcserialize.c \
	$(ABS_PATH)/src/ftglue.c \
	$(ABS_PATH)/src/fccache.c \
	$(ABS_PATH)/src/fcdefault.c \
	$(ABS_PATH)/src/fcinit.c \
	$(ABS_PATH)/src/fcname.c \
	$(ABS_PATH)/src/fcstat.c \
	$(ABS_PATH)/src/fccfg.c \
	$(ABS_PATH)/src/fcdir.c \
	$(ABS_PATH)/src/fclang.c \
	$(ABS_PATH)/src/fcobjs.c \
	$(ABS_PATH)/src/fcstr.c

LOCAL_C_INCLUDES := \
	$(ABS_PATH)/src \
	$(ABS_PATH)

LOCAL_EXPORT_C_INCLUDES:= $(ABS_PATH)

LOCAL_MODULE := fontconfig
LOCAL_SHARED_LIBRARIES:= expat freetype2
LOCAL_CFLAGS := -DHAVE_CONFIG_H=1

LOCAL_CFLAGS += -D_FORTIFY_SOURCE=2
LOCAL_CFLAGS += -Ofast -funroll-loops -flto

ifeq ($(NDK_DEBUG),"1")
# debug build
LOCAL_CFLAGS += -g -Wall -Wwrite-strings -Wsign-compare
LOCAL_CFLAGS += -Wextra  -Wno-empty-body -Wno-unused-parameter
LOCAL_CFLAGS += -Wformat-security
endif

include $(BUILD_SHARED_LIBRARY)

#define variable FREETYPE2_PATH=<path-to-freetype2-code>
# and same for EXPAT_PATH

import-it = 										\
	$(call import-add-path,$(shell dirname $(1)));	\
	$(call import-module,$(shell basename $(1))/$(2))

$(call import-it,$(EXPAT_PATH),expat/android/jni)
$(call import-it,$(FREETYPE2_PATH),builds/android/jni)
