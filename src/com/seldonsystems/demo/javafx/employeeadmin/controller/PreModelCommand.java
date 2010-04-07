/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.seldonsystems.demo.javafx.employeeadmin.controller;

import com.seldonsystems.demo.javafx.employeeadmin.model.RoleProxy;
import com.seldonsystems.demo.javafx.employeeadmin.model.UserProxy;
import com.seldonsystems.demo.javafx.employeeadmin.model.enums.DeptEnum;
import com.seldonsystems.demo.javafx.employeeadmin.model.enums.RoleEnum;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.RoleVO;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import java.util.ArrayList;
import java.util.List;
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
        userProxy.addItem(new UserVO("lstooge", "Larry", "Stooge", "larry@stooges.com", "ijk456", DeptEnum.ACCT));
        userProxy.addItem(new UserVO("cstooge", "Curly", "Stooge", "curly@stooges.com", "xyz987", DeptEnum.SALES));
        userProxy.addItem(new UserVO("mstooge", "Moe", "Stooge", "moe@stooges.com", "abc123", DeptEnum.PLANT));

        // register it
        getFacade().registerProxy(userProxy);

        // Create Role Proxy
        RoleProxy roleProxy = new RoleProxy();

        // Populate it with dummy data
        List<RoleEnum> roles = new ArrayList<RoleEnum>();
        roles.add(RoleEnum.PAYROLL);
        roles.add(RoleEnum.EMP_BENEFITS);
        roleProxy.addItem(new RoleVO("lstooge", roles));
        roles = new ArrayList<RoleEnum>();
        roles.add(RoleEnum.ACCT_PAY);
        roles.add(RoleEnum.ACCT_RCV);
        roles.add(RoleEnum.GEN_LEDGER);
        roleProxy.addItem(new RoleVO("cstooge", roles));
        roles = new ArrayList<RoleEnum>();
        roles.add(RoleEnum.INVENTORY);
        roles.add(RoleEnum.PRODUCTION);
        roles.add(RoleEnum.SALES);
        roles.add(RoleEnum.SHIPPING);
        roleProxy.addItem(new RoleVO("mstooge", roles));

        // register it
        getFacade().registerProxy(roleProxy);
    }
}
