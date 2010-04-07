/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.seldonsystems.demo.javafx.employeeadmin.controller;

import javafx.stage.Alert;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;

/**
 *
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class AddRoleResultCommand extends SimpleCommand {

    @Override
    public void execute(INotification notification) {
        Boolean result = (Boolean) notification.getBody();
        if( !result ) {
            Alert.inform("Add User Role", "Role already exists for this user!");
        }
    }
}
