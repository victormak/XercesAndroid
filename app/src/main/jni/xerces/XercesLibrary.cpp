//
// Created by gdc on 1/7/16.
//

#include "com_gdc_xercesandroid_MyXerces.h"

JNIEXPORT jstring JNICALL Java_com_gdc_xercesandroid_MyXerces_getTestStrFromXerces(JNIEnv *env, jobject)
{
    return env->NewStringUTF("from jni lib, not using xerces!");
}


