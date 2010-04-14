/*
 * PrepModelCommandFx.fx
 *
 * Created on Apr 13, 2010, 4:48:46 PM
 */
package com.seldonsystems.demo.javafx.employeeadmin.controller;

import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.interfaces.INotification;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import java.util.List;
import com.seldonsystems.demo.javafx.employeeadmin.model.enums.RoleEnum;
import java.util.ArrayList;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.RoleVO;
import com.seldonsystems.demo.javafx.employeeadmin.model.enums.DeptEnum;
import com.seldonsystems.demo.javafx.employeeadmin.model.UserProxy;
import com.seldonsystems.demo.javafx.employeeadmin.model.RoleProxy;

/**
 * @author Jhonghee
 */
public class PrepModelCommand extends SimpleCommand {

    /**
     * Prepare the Model.
     * @param notification
     */
    override function execute(notification: INotification): Void {
        // Create User Proxy
        var userProxy: UserProxy = new UserProxy();
        // Populate it with dummy data
        userProxy.addItem(new UserVO("lstooge", "Larry", "Stooge", "larry@stooges.com", "ijk456", DeptEnum.ACCT));
        userProxy.addItem(new UserVO("cstooge", "Curly", "Stooge", "curly@stooges.com", "xyz987", DeptEnum.SALES));
        userProxy.addItem(new UserVO("mstooge", "Moe", "Stooge", "moe@stooges.com", "abc123", DeptEnum.PLANT));
        // register it
        getFacade().registerProxy(userProxy);
        // Create Role Proxy
        var roleProxy: RoleProxy = new RoleProxy();
        // Populate it with dummy data
        var roles: List = new ArrayList();
        roles.add(RoleEnum.PAYROLL);
        roles.add(RoleEnum.EMP_BENEFITS);
        roleProxy.addItem(new RoleVO("lstooge", roles));
        roles = new ArrayList();
        roles.add(RoleEnum.ACCT_PAY);
        roles.add(RoleEnum.ACCT_RCV);
        roles.add(RoleEnum.GEN_LEDGER);
        roleProxy.addItem(new RoleVO("cstooge", roles));
        roles = new ArrayList();
        roles.add(RoleEnum.INVENTORY);
        roles.add(RoleEnum.PRODUCTION);
        roles.add(RoleEnum.SALES);
        roles.add(RoleEnum.SHIPPING);
        roleProxy.addItem(new RoleVO("mstooge", roles));
        // register it
        getFacade().registerProxy(roleProxy);
    }

}
