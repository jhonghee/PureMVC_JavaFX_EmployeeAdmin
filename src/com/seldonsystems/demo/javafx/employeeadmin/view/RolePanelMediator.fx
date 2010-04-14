/*
 * RolePanelMediatorFx.fx
 *
 * Created on Apr 14, 2010, 4:16:19 AM
 */
package com.seldonsystems.demo.javafx.employeeadmin.view;

import com.seldonsystems.demo.javafx.employeeadmin.view.component.RolePanel;
import org.puremvc.java.multicore.interfaces.INotification;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import com.seldonsystems.demo.javafx.employeeadmin.ApplicationFacade;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.RoleVO;
import java.util.ArrayList;
import com.seldonsystems.demo.javafx.employeeadmin.model.enums.RoleEnum;
import javafx.scene.input.MouseEvent;
import org.puremvc.java.multicore.patterns.mediator.Mediator;
import com.seldonsystems.demo.javafx.employeeadmin.model.RoleProxy;

public def NAME: String = "rolePanel";

/**
 * @author Jhonghee
 */
public class RolePanelMediator extends Mediator {

    public var view: RolePanel;
    var roleProxy: RoleProxy;

    init {
        init(NAME, view)
    }

    override function handleNotification(notification: INotification): Void {
        var note: String = notification.getName();
        if (note.equals(ApplicationFacade.NEW_USER)) {
            clearForm();
        } else if (note.equals(ApplicationFacade.USER_ADDED)) {
            var user: UserVO = notification.getBody() as UserVO;
            view.user = user;
            var roleVO: RoleVO = new RoleVO(user.getUsername(), new ArrayList());
            roleProxy.addItem(roleVO);
            clearForm();
        } else if (note.equals(ApplicationFacade.USER_UPDATED)) {
            clearForm();
        } else if (note.equals(ApplicationFacade.USER_DELETED)) {
            clearForm();
        } else if (note.equals(ApplicationFacade.CANCEL_SELECTED)) {
            clearForm();
        } else if (note.equals(ApplicationFacade.USER_SELECTED)) {
            var user: UserVO = notification.getBody() as UserVO;
            view.user = user;
            view.userRoles = roleProxy.getUserRoles(user.getUsername());
            reset();
        } else if (note.equals(ApplicationFacade.ADD_ROLE_RESULT)) {

        }
    }

    override function listNotificationInterests(): nativearray of String {
        var interests = [
                    ApplicationFacade.NEW_USER,
                    ApplicationFacade.USER_ADDED,
                    ApplicationFacade.USER_UPDATED,
                    ApplicationFacade.USER_DELETED,
                    ApplicationFacade.CANCEL_SELECTED,
                    ApplicationFacade.USER_SELECTED,
                    ApplicationFacade.ADD_ROLE_RESULT] as nativearray of String;
        return interests;
    }

    override function onRegister(): Void {
        view.listView.onMouseClicked = function (event: MouseEvent) {
            view.rolePicker.selectItem(RoleEnum.NONE_SELECTED.getLabel());
            view.selectedRole = RoleEnum.getEnumByLabel(view.listView.selectedItem as String);
        }
        view.rolePicker.onIndexChange = function (index: Integer) {
            view.selectedRole = null;
            view.listView.clearSelection();
            view.selectedRole = RoleEnum.getEnumByLabel(view.rolePicker.selectedItem as String);
        }
        view.addButton.action = function () {
            onAddRole(view.user, view.selectedRole);
        }
        view.removeButton.action = function () {
            onRemoveRole(view.user, view.selectedRole);
        }
        roleProxy = getFacade().retrieveProxy(RoleProxy.NAME) as RoleProxy;
    }

    function onAddRole(user: UserVO, selectedRole: RoleEnum): Void {
        roleProxy.addRoleToUser(user, selectedRole);
        view.userRoles = roleProxy.getUserRoles(user.getUsername());
    }

    function onRemoveRole(user: UserVO, selectedRole: RoleEnum): Void {
        roleProxy.removeRoleFromUser(user, selectedRole);
        view.userRoles = roleProxy.getUserRoles(user.getUsername());
    }

    function clearForm(): Void {
        view.user = null;
        view.userRoles = null;
        view.selectedRole = null;
        reset();
    }

    function reset(): Void {
        view.rolePicker.selectItem(RoleEnum.NONE_SELECTED.getLabel());
    }

}
