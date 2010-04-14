/*
 * ApplicationFacadeFx.fx
 *
 * Created on Apr 13, 2010, 2:53:04 PM
 */

package com.seldonsystems.demo.javafx.employeeadmin;

import com.seldonsystems.demo.javafx.employeeadmin.controller.StartupCommand;
import com.seldonsystems.demo.javafx.employeeadmin.controller.DeleteUserCommand;
import com.seldonsystems.demo.javafx.employeeadmin.controller.AddRoleResultCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;
import com.seldonsystems.demo.javafx.employeeadmin.Main.MainFrame;

// Application name
public def NAME:String = "EmployeeAdmin";

// Notification name constants
public def STARTUP:String = "startUp";
public def DELETE_USER:String = "deleteUser";
public def NEW_USER:String = "newUser";
public def ADD_ROLE_RESULT:String = "addRoleResult";

public def USER_ADDED:String = "userAdded";
public def USER_UPDATED:String = "userUpdated";
public def USER_DELETED:String = "userDeleted";
public def USER_SELECTED:String = "userSelected";
public def CANCEL_SELECTED:String = "cancelSelected";

/**
 * @author Jhonghee
 */

public class ApplicationFacade extends Facade {

    public var key:String;

    public function startup(mainFrame:MainFrame):Void {
       sendNotification(STARTUP, mainFrame);
    }

    /**
     *  Register commands with the controller
     */
    override function initializeController():Void {
        super.initializeController();
        registerCommand(STARTUP, new StartupCommand());
        registerCommand(DELETE_USER, new DeleteUserCommand());
        registerCommand(ADD_ROLE_RESULT, new AddRoleResultCommand());
    }

    init {
        init(key);

        // Singleton Check.
        if( instanceMap.get(key) == null ) {
            instanceMap.put(key, this);
        }

    }
}
