package ua.com.codefire.wstest.controller;

import java.util.Date;

/**
 * Created by human on 3/20/16.
 */
public class Message {

    private Date timestamp;
    private String text;

    public Message(Date timestamp, String text) {
        this.timestamp = timestamp;
        this.text = text;
    }

    public Message(String text) {
        this(new Date(), text);
    }

    public Message() {
        this("Empty message!");
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public String getText() {
        return text;
    }
}
