/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.seldonsystems.demo.javafx.employeeadmin.view;

import com.seldonsystems.demo.javafx.employeeadmin.model.UserProxy;
import com.seldonsystems.demo.javafx.employeeadmin.view.component.IUserList;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

/**
 *
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class UserListMediator extends Mediator {

    public static final String LOOKUP_ID = "userList";

    private UserProxy userProxy;

    public UserListMediator(Object viewComponent) {
        super(NAME, viewComponent);
    }

    private IUserList getUserList() {
        return (IUserList) getViewComponent();
    }

    @Override
    public void handleNotification(INotification notification) {
        super.handleNotification(notification);
    }

    @Override
    public String[] listNotificationInterests() {
        return super.listNotificationInterests();
    }

    @Override
    public void onRegister() {
        getUserList().setMediator(this);
        
        userProxy = (UserProxy) getFacade().retrieveProxy(UserProxy.NAME);
        getUserList().setUsers(userProxy.getUsers());

    }

    public void onDelete() {
        System.out.println("Delete button was pressed");
    }

    public void onNew() {
        System.out.println("New button was pressed");
    }


}
