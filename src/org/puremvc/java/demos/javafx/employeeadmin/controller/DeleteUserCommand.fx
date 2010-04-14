/*
 * DeleteUserCommandFx.fx
 *
 * Created on Apr 14, 2010, 2:46:53 AM
 */

package org.puremvc.java.demos.javafx.employeeadmin.controller;

import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.demos.javafx.employeeadmin.model.vo.UserVO;
import org.puremvc.java.demos.javafx.employeeadmin.ApplicationFacade;
import org.puremvc.java.demos.javafx.employeeadmin.model.UserProxy;

/**
 * @author Jhonghee Park
 */

public class DeleteUserCommand extends SimpleCommand {

    override function execute(notification:INotification):Void {
        var selectedUser:UserVO = notification.getBody() as UserVO;
        var userProxy:UserProxy = getFacade().retrieveProxy(UserProxy.NAME) as UserProxy;
        userProxy.deleteItem(selectedUser);
        sendNotification(ApplicationFacade.USER_DELETED);
    }
}
