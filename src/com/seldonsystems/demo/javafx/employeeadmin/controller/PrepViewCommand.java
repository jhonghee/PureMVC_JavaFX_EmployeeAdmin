/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.seldonsystems.demo.javafx.employeeadmin.controller;

import com.seldonsystems.demo.javafx.employeeadmin.view.UserFormMediator;
import com.seldonsystems.demo.javafx.employeeadmin.view.UserListMediator;
import javafx.scene.Scene;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;

/**
 *
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
class PrepViewCommand extends SimpleCommand {

    /**
     * Prepare the View.
     * 
     * Get the view components for the Mediators from the stage,
     * a reference to which was passed on the original startup notification.
     *
     * @param notification
     */
    @Override
    public void execute(INotification notification) {
       Scene scene = (Scene) notification.getBody();
       getFacade().registerMediator(new UserListMediator(scene.lookup(UserListMediator.LOOKUP_ID)));
       getFacade().registerMediator(new UserFormMediator(scene.lookup(UserFormMediator.LOOKUP_ID)));
       
    }


}
