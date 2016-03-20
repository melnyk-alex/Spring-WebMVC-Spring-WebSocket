package ua.com.codefire.wstest.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * Created by human on 3/20/16.
 */
@Controller
//@RequestMapping("/")
public class BaseController {

//    @ResponseStatus(HttpStatus.PERMANENT_REDIRECT)
//    @RequestMapping(method = RequestMethod.GET, path = "/")
//    public String getRoot() {
//        return "redirect:/index";
//    }

    @RequestMapping(method = RequestMethod.GET, path = "/index")
    public String getIndex() {
        return "index";
    }
}
