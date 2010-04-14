/*
 * AddRoleResultCommandFx.fx
 *
 * Created on Apr 14, 2010, 2:52:00 AM
 */

package org.puremvc.java.demos.javafx.employeeadmin.controller;

import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.interfaces.INotification;
import javafx.stage.Alert;

/**
 * @author Jhonghee
 */

public class AddRoleResultCommand extends SimpleCommand {

    override function execute(notification:INotification):Void {
        var result:Boolean = notification.getBody() as Boolean;
        if( not result ) {
            Alert.inform("Add User Role", "Role already exists for this user!");
        }

    }

}
