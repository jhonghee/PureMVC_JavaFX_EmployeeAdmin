/*
 * PrepViewCommandFx.fx
 *
 * Created on Apr 13, 2010, 4:50:44 PM
 */

package com.seldonsystems.demo.javafx.employeeadmin.controller;

import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.interfaces.INotification;
import com.seldonsystems.demo.javafx.employeeadmin.Main.MainFrame;
import com.seldonsystems.demo.javafx.employeeadmin.view.UserListMediator;
import com.seldonsystems.demo.javafx.employeeadmin.view.RolePanelMediator;
import com.seldonsystems.demo.javafx.employeeadmin.view.UserFormMediator;

/**
 * @author Jhonghee
 */

public class PrepViewCommand extends SimpleCommand {

    /**
     * Prepare the View.
     *
     * Get the view components for the Mediators from the stage,
     * a reference to which was passed on the original startup notification.
     *
     * @param notification
     */
     override function execute(notification:INotification):Void {
         var mainFrame:MainFrame = notification.getBody() as MainFrame;

         getFacade().registerMediator(UserListMediator {view: mainFrame.userList});
         getFacade().registerMediator(UserFormMediator {view: mainFrame.userForm});
         getFacade().registerMediator(RolePanelMediator {view: mainFrame.rolePanel});

     }

}
