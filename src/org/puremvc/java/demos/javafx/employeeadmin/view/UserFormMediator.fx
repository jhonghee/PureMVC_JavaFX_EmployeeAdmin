/*
 * UserFormMediatorFx.fx
 *
 * Created on Apr 14, 2010, 3:08:05 AM
 */
package org.puremvc.java.demos.javafx.employeeadmin.view;

import org.puremvc.java.demos.javafx.employeeadmin.view.component.UserForm;
import org.puremvc.java.demos.javafx.employeeadmin.model.enums.DeptEnum;
import org.puremvc.java.demos.javafx.employeeadmin.model.vo.UserVO;
import org.puremvc.java.demos.javafx.employeeadmin.ApplicationFacade;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.mediator.Mediator;
import org.puremvc.java.demos.javafx.employeeadmin.model.UserProxy;

/**
 * @author Jhonghee
 */
public def NAME: String = "userForm";
public def MODE_ADD: String = "modeAdd";
public def MODE_EDIT: String = "modeEdit";

public class UserFormMediator extends Mediator {

    public var view: UserForm;
    var userProxy: UserProxy;

    init {
        init(NAME, view)
        }

    override function handleNotification(notification: INotification): Void {
        var note: String = notification.getName();
        var user: UserVO = notification.getBody() as UserVO;
        if (note.equals(ApplicationFacade.NEW_USER)) {
            setUser(user, MODE_ADD);
        } else if (note.equals(ApplicationFacade.USER_DELETED)) {
            reset();
        } else if (note.equals(ApplicationFacade.USER_SELECTED)) {
            setUser(user, MODE_EDIT);
        }
    }

    override function listNotificationInterests(): nativearray of String {
        var interests = [
                    ApplicationFacade.NEW_USER,
                    ApplicationFacade.USER_DELETED,
                    ApplicationFacade.USER_SELECTED] as nativearray of String;
        return interests;
    }

    override function onRegister(): Void {
        view.departmentField.onIndexChange = function (index: Integer) {
            view.department = DeptEnum.getEnumByLabel(view.departmentField.selectedItem as String);
        }
        view.updateButton.action = function () {
            view.user = new UserVO(
            view.usernameField.text,
            view.fnameField.text,
            view.lnameField.text,
            view.emailField.text,
            view.passwordField.text,
            DeptEnum.getEnumByLabel(view.departmentField.selectedItem as String));

            if (view.mode == MODE_ADD) {
                onAdd(view.user);
            } else {
                onUpdate(view.user);
            }
        }
        view.cancelButton.action = function () {
            reset();
            onCancel();
        }
        userProxy = getFacade().retrieveProxy(UserProxy.NAME) as UserProxy;
    }

    function onCancel(): Void {
        sendNotification(ApplicationFacade.CANCEL_SELECTED);
    }

    function onAdd(user: UserVO): Void {
        userProxy.addItem(user);
        sendNotification(ApplicationFacade.USER_ADDED, user);
        reset();
    }

    function onUpdate(user: UserVO): Void {
        userProxy.updateItem(user);
        sendNotification(ApplicationFacade.USER_UPDATED, user);
        reset();
    }

    function reset(): Void {
        view.user = null;
        view.username = "";
        view.fname = "";
        view.lname = "";
        view.email = "";
        view.password = "";
        view.confirmed = "";
        view.department = DeptEnum.NONE_SELECTED;
        view.departmentField.selectItem(DeptEnum.NONE_SELECTED.getLabel());
    }

    function setUser(user: UserVO, mode: String): Void {
        view.user = user;
        view.username = user.getUsername();
        view.fname = user.getFname();
        view.lname = user.getLname();
        view.email = user.getEmail();
        view.password = user.getPassword();
        view.confirmed = user.getPassword();
        view.department = user.getDepartment();
        view.mode = mode;
        // Unfortunately, XPicker does not have bindable property.
        view.departmentField.selectItem(user.getDepartment().getLabel());
    }

}
