package com.owner.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.owner.dao.IUserDAO;
import com.owner.dao.impl.UserDAOImpl;
import com.owner.entity.Contact;
import com.owner.entity.UserTable;

@Controller
@SessionAttributes
public class ContactController {
	@Resource(name = "userDAO")
	private IUserDAO userDAO;
	
    @RequestMapping(value = "/addContact", method = RequestMethod.POST)
    public String addContact(@ModelAttribute("contact")
                            Contact contact, BindingResult result) {
        UserTable userTable = new UserTable();
        userTable.setPassword( contact.getLastname() );
        userTable.setUserName( contact.getFirstname() );
    	boolean r = userDAO.addUser( userTable );
        System.out.println(r);
        System.out.println("First Name:" + contact.getFirstname() +
                    "Last Name:" + contact.getLastname());
        return "redirect:contacts.html";
    }
    @RequestMapping("/contacts")
    public ModelAndView showContacts() {
        return new ModelAndView("contact", "command", new Contact());
    }
      
}
