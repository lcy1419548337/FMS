package com.bs.help;

import java.sql.Timestamp;

public class String2timeStamp {
	public static Timestamp str2TimeStamp(String date){
        Timestamp ts = new Timestamp(System.currentTimeMillis());
        try {
            ts = Timestamp.valueOf(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ts;
    }
}
