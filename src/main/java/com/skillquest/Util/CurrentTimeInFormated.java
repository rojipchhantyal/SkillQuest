package com.skillquest.Util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CurrentTimeInFormated {

    public static String getCurrentTimeInFormated(){

        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("h:mm a dd-MM-yyyy");

        return now.format(formatter);
    }
}
