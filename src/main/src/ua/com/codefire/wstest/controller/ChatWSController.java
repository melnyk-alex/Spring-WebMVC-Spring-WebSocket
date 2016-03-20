package ua.com.codefire.wstest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

/**
 * Created by human on 3/20/16.
 */
@Controller
public class ChatWSController {

    @Autowired
    private History history;

    @MessageMapping("/update")
    @SendTo("/topic/update-history")
    public History doUpdate() throws Exception {
//        Thread.sleep(3000); // simulated delay
        return history;
    }

    @MessageMapping("/send-message")
    @SendTo("/topic/update-history")
    public History doSend(Message message) throws Exception {
//        Thread.sleep(3000); // simulated delay
        return history.add(message);
    }

}