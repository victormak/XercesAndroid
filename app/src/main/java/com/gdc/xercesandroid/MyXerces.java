package com.gdc.xercesandroid;

/**
 * Created by gdc on 1/7/16.
 */
public class MyXerces {

    static{
        System.loadLibrary("MyXercesLibrary");
    }

    public native String getTestStrFromXerces();
}
