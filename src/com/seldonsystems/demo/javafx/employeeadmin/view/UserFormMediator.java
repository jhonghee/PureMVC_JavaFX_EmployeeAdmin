/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.seldonsystems.demo.javafx.employeeadmin.view;

import com.seldonsystems.demo.javafx.employeeadmin.ApplicationFacade;
import com.seldonsystems.demo.javafx.employeeadmin.model.UserProxy;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import com.seldonsystems.demo.javafx.employeeadmin.view.component.interfaces.IUserForm;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

/**
 *
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class UserFormMediator extends Mediator {

    public static final String LOOKUP_ID = "userForm";
    
    private UserProxy userProxy;

    public UserFormMediator(Object viewComponent) {
        super(LOOKUP_ID, viewComponent);
    }

    private IUserForm getUserForm() {
        return (IUserForm) getViewComponent();
    }

    @Override
    public void handleNotification(INotification notification) {
        String note = notification.getName();

        if( note.equals(ApplicationFacade.NEW_USER)) {
            getUserForm().setUser((UserVO) notification.getBody(), IUserForm.MODE_ADD);
        }
        else if( note.equals(ApplicationFacade.USER_DELETED)) {
            getUserForm().reset();
        }
        else if( note.equals(ApplicationFacade.USER_SELECTED)) {
            getUserForm().setUser((UserVO) notification.getBody(), IUserForm.MODE_EDIT);
        }
    }

    @Override
    public String[] listNotificationInterests() {
        String[] interests = {ApplicationFacade.NEW_USER, ApplicationFacade.USER_DELETED, ApplicationFacade.USER_SELECTED};
        return interests;
    }

    @Override
    public void onRegister() {
        getUserForm().setMediator(this);

        userProxy = (UserProxy) getFacade().retrieveProxy(UserProxy.NAME);
        
    }

    public void onCancel() {
        sendNotification(ApplicationFacade.CANCEL_SELECTED);
    }
}
