/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.seldonsystems.demo.javafx.employeeadmin.view;

import com.seldonsystems.demo.javafx.employeeadmin.ApplicationFacade;
import com.seldonsystems.demo.javafx.employeeadmin.model.RoleProxy;
import com.seldonsystems.demo.javafx.employeeadmin.model.enums.RoleEnum;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.RoleVO;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import com.seldonsystems.demo.javafx.employeeadmin.view.component.interfaces.IRolePanel;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

/**
 *
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class RolePanelMediator extends Mediator {

    public static final String LOOKUP_ID = "rolePanel";
    private RoleProxy roleProxy;

    public RolePanelMediator(Object viewComponent) {
        super(LOOKUP_ID, viewComponent);
    }

    private IRolePanel getRolePanel() {
        return (IRolePanel) getViewComponent();
    }

    @Override
    public void handleNotification(INotification notification) {
        String note = notification.getName();

        if( note.equals(ApplicationFacade.NEW_USER)) {
            getRolePanel().clearForm();
        }
        else if( note.equals(ApplicationFacade.USER_ADDED)) {
            UserVO user = (UserVO)notification.getBody();
            getRolePanel().setUser(user);
            RoleVO roleVO = new RoleVO(user.getUsername(), new ArrayList<RoleEnum>());
            roleProxy.addItem(roleVO);
            getRolePanel().clearForm();
        }
        else if( note.equals(ApplicationFacade.USER_UPDATED)) {
            getRolePanel().clearForm();
        }
        else if( note.equals(ApplicationFacade.USER_DELETED)) {
            getRolePanel().clearForm();
        }
        else if( note.equals(ApplicationFacade.CANCEL_SELECTED)) {
            getRolePanel().clearForm();
        }
        else if( note.equals(ApplicationFacade.USER_SELECTED)) {
            UserVO user = (UserVO)notification.getBody();
            getRolePanel().setUser(user);
            getRolePanel().setUserRoles(roleProxy.getUserRoles(user.getUsername()));
            getRolePanel().reset();
        }
        else if( note.equals(ApplicationFacade.ADD_ROLE_RESULT)) {
            
        }
    }

    @Override
    public String[] listNotificationInterests() {
        String[] interests = {
            ApplicationFacade.NEW_USER,
            ApplicationFacade.USER_ADDED,
            ApplicationFacade.USER_UPDATED,
            ApplicationFacade.USER_DELETED,
            ApplicationFacade.CANCEL_SELECTED,
            ApplicationFacade.USER_SELECTED,
            ApplicationFacade.ADD_ROLE_RESULT};
        return interests;
    }

    @Override
    public void onRegister() {
        getRolePanel().setMediator(this);

        roleProxy = (RoleProxy) getFacade().retrieveProxy(RoleProxy.NAME);
    }

    public void onAddRole(UserVO user, RoleEnum selectedRole) {
        roleProxy.addRoleToUser(user, selectedRole);
        getRolePanel().setUserRoles(roleProxy.getUserRoles(user.getUsername()));
    }

    public void onRemoveRole(UserVO user, RoleEnum selectedRole) {
        roleProxy.removeRoleFromUser(user, selectedRole);
        getRolePanel().setUserRoles(roleProxy.getUserRoles(user.getUsername()));
    }
}
