/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.seldonsystems.demo.javafx.employeeadmin;

import com.seldonsystems.demo.javafx.employeeadmin.controller.StartupCommand;
import javafx.scene.Scene;
import org.puremvc.java.multicore.patterns.facade.Facade;

/**
 *
 * @author Jhonghee Park
 */
public class ApplicationFacade extends Facade {

    // Application name
    public static final String NAME = "EmployeeAdmin";

    // command
    public static final String STARTUP = "startUp";

    // Constructor
    private ApplicationFacade(String key) {
        super(key);
    }

    /**
     * Singleton Factory Method
     */
    public static ApplicationFacade getInstance(String key) {
        if( instanceMap.get(key) == null ) {
            instanceMap.put(key, new ApplicationFacade(key));
        }
        return (ApplicationFacade) instanceMap.get(key);
    }

    /**
     * Register commands with the Controller
     */
    @Override
    protected void initializeController() {
        super.initializeController();
        registerCommand(STARTUP, new StartupCommand());
    }

    public void startup(Scene scene) {
        sendNotification(STARTUP, scene);
    }

}
