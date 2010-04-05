/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.seldonsystems.demo.javafx.employeeadmin.controller;

import com.seldonsystems.demo.javafx.employeeadmin.model.UserProxy;
import com.seldonsystems.demo.javafx.employeeadmin.model.enums.DeptEnum;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;

/**
 *
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
class PreModelCommand extends SimpleCommand {

    /**
     * Prepare the Model.
     * @param notification
     */
    @Override
    public void execute(INotification notification) {

        // Create User Proxy
        UserProxy userProxy = new UserProxy();

        // Populate it with dummy data
        userProxy.addItem( new UserVO("lstooge", "Larry", "Stooge", "larry@stooges.com", "ijk456", DeptEnum.ACCT));
        
    }


}
