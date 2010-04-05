/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.seldonsystems.demo.javafx.employeeadmin.controller;

import org.puremvc.java.multicore.patterns.command.MacroCommand;

/**
 *
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class StartupCommand extends MacroCommand {


    /**
     * Add the Subcommands to startup the PureMVC apparatus.
     * 
     * Generally, it is best to pre the Model (mostly registering proxies)
     * followed by preparation of the View (mostly registering Mediators).
     */
    @Override
    protected void initializeMacroCommand() {
        this.addSubCommand(new PreModelCommand());
        this.addSubCommand(new PrepViewCommand());
    }

}
