/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.seldonsystems.demo.javafx.employeeadmin.controller;

import com.seldonsystems.demo.javafx.employeeadmin.ApplicationFacade;
import com.seldonsystems.demo.javafx.employeeadmin.model.UserProxy;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;

/**
 *
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class DeleteUserCommand extends SimpleCommand {

    @Override
    public void execute(INotification notification) {
        UserVO selectedUser = (UserVO)notification.getBody();
        UserProxy userProxy = (UserProxy) getFacade().retrieveProxy(UserProxy.NAME);
        userProxy.deleteItem(selectedUser);
        sendNotification(ApplicationFacade.USER_DELETED);
    }



}
