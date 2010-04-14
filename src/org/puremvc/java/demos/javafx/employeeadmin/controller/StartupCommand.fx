/*
 * StartupCommandFx.fx
 *
 * Created on Apr 13, 2010, 4:45:22 PM
 */

package org.puremvc.java.demos.javafx.employeeadmin.controller;

import org.puremvc.java.multicore.patterns.command.MacroCommand;

/**
 * @author Jhonghee
 */

public class StartupCommand extends MacroCommand {

    /**
     * Add the Subcommands to startup the PureMVC apparatus.
     *
     * Generally, it is best to pre the Model (mostly registering proxies)
     * followed by preparation of the View (mostly registering Mediators).
     */
     override function initializeMacroCommand() {
         addSubCommand(new PrepModelCommand());
         addSubCommand(new PrepViewCommand());
     }

}
