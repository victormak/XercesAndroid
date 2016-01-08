LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

XERCES_SUBDIRS := $(patsubst $(LOCAL_PATH)/%, %, $(shell find $(LOCAL_PATH)/src/xercesc/ -type d))

LOCAL_MODULE := MyXercesLibrary

LOCAL_C_INCLUDES := $(LOCAL_PATH) $(LOCAL_PATH)/src $(LOCAL_PATH)/include \
                    $(LOCAL_PATH)/.. \
                    $(LOCAL_PATH)/include/xercesc/util \
                    $(LOCAL_PATH)/include/xercesc/util/MsgLoaders/InMemory \
                    $(LOCAL_PATH)/include/xercesc/dom \
                    $(LOCAL_PATH)/include/xercesc/dom/impl \
                    $(LOCAL_PATH)/include/xercesc/validators \
                    $(LOCAL_PATH)/include/xercesc/validators/schema \
                    $(LOCAL_PATH)/include/xercesc/validators/schema/identity \
                    $(LOCAL_PATH)/include/xercesc/util/Transcoders/IconvGNU \
                    $(LOCAL_PATH)/include/xercesc/sax \
                    $(LOCAL_PATH)/include/xercesc/sax2 \
                    $(LOCAL_PATH)/include/xercesc/framework \
                    $(LOCAL_PATH)/include/xercesc/framework/psvi \
                    $(LOCAL_PATH)/include/xercesc/internal \
                    $(LOCAL_PATH)/include/xercesc/parsers \
                    $(LOCAL_PATH)/include/xercesc/util/FileManagers \
                    $(LOCAL_PATH)/include/xercesc/util/MsgLoaders \
                    $(LOCAL_PATH)/include/xercesc/util/MsgLoaders/ICU \
                    $(LOCAL_PATH)/include/xercesc/util/MsgLoaders/ICU/resources \
                    $(LOCAL_PATH)/include/xercesc/util/MsgLoaders/MsgCatalog \
                    $(LOCAL_PATH)/include/xercesc/util/MsgLoaders/Win32 \
                    $(LOCAL_PATH)/include/xercesc/util/MutexManagers \
                    $(LOCAL_PATH)/include/xercesc/util/NetAccessors \
                    $(LOCAL_PATH)/include/xercesc/util/NetAccessors/Curl \
                    $(LOCAL_PATH)/include/xercesc/util/NetAccessors/MacOSURLAccessCF \
                    $(LOCAL_PATH)/include/xercesc/util/NetAccessors/Socket \
                    $(LOCAL_PATH)/include/xercesc/util/NetAccessors/WinSock \
                    $(LOCAL_PATH)/include/xercesc/utdil/regx \
                    $(LOCAL_PATH)/include/xercesc/util/Transcoders \
                    $(LOCAL_PATH)/include/xercesc/util/Transcoders/Iconv \
                    $(LOCAL_PATH)/include/xercesc/util/Transcoders/ICU \
                    $(LOCAL_PATH)/include/xercesc/util/Transcoders/MacOSUnicodeConverter \
                    $(LOCAL_PATH)/include/xercesc/util/Transcoders/Win32 \
                    $(LOCAL_PATH)/include/xercesc/validators/common \
                    $(LOCAL_PATH)/include/xercesc/validators/datatype \
                    $(LOCAL_PATH)/include/xercesc/validators/DTD \
                    $(LOCAL_PATH)/include/xercesc/xinclude \

LOCAL_CFLAGS := -Os -DHAVE_CONFIG_H
ifeq ($(TARGET_ARCH_ABI),x86)
    LOCAL_CFLAGS += -mtune=atom -msse -mfpmath=sse -mssse3 -DUSE_SSE=1
endif

LOCAL_CPP_FEATURES += exceptions
LOCAL_CPP_EXTENSION := .cpp

LOCAL_SRC_FILES := XercesLibrary.cpp
LOCAL_SRC_FILES += $(addprefix src/,$(notdir $(wildcard $(LOCAL_PATH)/src/*.cpp $(LOCAL_PATH)/src/*.c)))
LOCAL_SRC_FILES += $(foreach F, $(XERCES_SUBDIRS), $(addprefix $(F)/,$(notdir $(wildcard $(LOCAL_PATH)/$(F)/*.cpp $(LOCAL_PATH)/$(F)/*.c))))


include $(BUILD_SHARED_LIBRARY)