package ua.com.codefire.wstest.controller;

import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by human on 3/20/16.
 */
@Component
public class History {

    private List<Message> messages;

    @PostConstruct
    void init() {
        this.messages = Collections.synchronizedList(new ArrayList<Message>());
    }

    public History add(Message message) {
        messages.add(message);
        return this;
    }

    public List<Message> getMessages() {
        return messages;
    }
}
