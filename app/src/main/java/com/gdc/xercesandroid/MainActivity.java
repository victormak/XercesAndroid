package com.gdc.xercesandroid;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    TextView tv;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        MyXerces lib = new MyXerces();
        tv = (TextView)findViewById(R.id.tv);
        tv.setText(lib.getTestStrFromXerces());
    }
}
