/*
 * UserListMediatorFx.fx
 *
 * Created on Apr 13, 2010, 4:54:52 PM
 */
package com.seldonsystems.demo.javafx.employeeadmin.view;

import com.seldonsystems.demo.javafx.employeeadmin.view.component.UserList;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import com.seldonsystems.demo.javafx.employeeadmin.ApplicationFacade;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.mediator.Mediator;
import com.seldonsystems.demo.javafx.employeeadmin.model.UserProxy;

/**
 * @author Jhonghee
 */

public def NAME:String = "userList";

public class UserListMediator extends Mediator {

    public var view: UserList;
    var userProxy: UserProxy;

    init {
        init(NAME, view)
    }

    override function handleNotification(notification:INotification):Void {
        var note:String = notification.getName();

        if( note.equals(ApplicationFacade.USER_DELETED)) {
            view.users = userProxy.getUsers().users;
        }
        else if( note.equals(ApplicationFacade.CANCEL_SELECTED)) {
            view.swingTable.getJTable().clearSelection();
        }
        else if( note.equals(ApplicationFacade.USER_ADDED)) {
            view.users = userProxy.getUsers().users;
        }
        else if( note.equals(ApplicationFacade.USER_UPDATED)) {
            view.users = userProxy.getUsers().users;
        }
    }


    override function listNotificationInterests():nativearray of String {
        var interests = [
                ApplicationFacade.USER_DELETED,
                ApplicationFacade.CANCEL_SELECTED,
                ApplicationFacade.USER_ADDED,
                ApplicationFacade.USER_UPDATED] as nativearray of String;
        return interests;
    }


    override function onRegister(): Void {
        view.swingTable.onSelectedRowsChanged = function (selected: Integer[]) {
            if (sizeof selected > 0) {
                view.disableDelete = false;
                view.selectedIndex = selected[0];
                onSelect(view.users[view.selectedIndex] as UserVO);
            } else {
                view.disableDelete = true;
            }

        }
        view.deleteButton.action = function () {
            if (view.selectedIndex != -1) {
                onDelete(view.users[view.selectedIndex] as UserVO)
            }
        }
        view.newButton.action = function () {
            onNew()
        }
        userProxy = getFacade().retrieveProxy(UserProxy.NAME) as UserProxy;
        view.users = userProxy.getUsers().users;
    }

    public function onSelect(selected: UserVO): Void {
        sendNotification(ApplicationFacade.USER_SELECTED, selected);
    }

    public function onDelete(selected: UserVO): Void {
        sendNotification(ApplicationFacade.DELETE_USER, selected);
    }

    public function onNew(): Void {
        sendNotification(ApplicationFacade.NEW_USER, new UserVO());
    }

}
