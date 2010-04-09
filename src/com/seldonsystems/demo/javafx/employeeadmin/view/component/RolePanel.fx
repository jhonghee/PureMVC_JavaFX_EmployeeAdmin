/*
 * RolePanel.fx
 *
 * Created on Apr 6, 2010, 4:13:29 PM
 */
package com.seldonsystems.demo.javafx.employeeadmin.view.component;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import com.seldonsystems.demo.javafx.employeeadmin.view.RolePanelMediator;
import javafx.scene.control.Label;
import javafx.scene.control.Button;
import org.jfxtras.scene.control.XPicker;
import org.jfxtras.scene.control.XPickerType;
import com.seldonsystems.demo.javafx.employeeadmin.model.enums.RoleEnum;
import javafx.scene.control.ListView;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import java.util.List;
import javafx.scene.input.MouseEvent;
import javafx.scene.Group;

/**
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class RolePanel extends CustomNode, IRolePanel {

    public var x: Number;
    public var y: Number;
    // Refs to view components
    var rolePanel: Group;
    var rolePicker: XPicker;
    var listView: ListView;
    // Mediators and Models
    var mediator: RolePanelMediator;
    var user: UserVO;
    var userRoles: Object[];
    var selectedRole: RoleEnum;

    // For IRolePanel
    override public function setMediator(mediator: RolePanelMediator): Void {
        this.mediator = mediator;
    }

    override public function setUser(user: UserVO): Void {
        this.user = user;
    }

    override public function setUserRoles(userRoles: List): Void {
        this.userRoles = userRoles.toArray();
    }

    override public function clearForm(): Void {
        this.user = null;
        this.userRoles = null;
        this.selectedRole = null;
        reset();
    }

    override public function reset(): Void {
        this.rolePicker.selectItem(RoleEnum.NONE_SELECTED.getLabel());
    }

    override protected function create(): Node {
        rolePanel = Group {
            layoutX: bind x
            layoutY: bind y
            content: [
                Label {
                    text: "User Roles"
                }
                listView = ListView {
                    layoutY: 20
                    width: 270
                    height: 185
                    items: bind userRoles
                    onMouseClicked: function (event: MouseEvent) {
                        rolePicker.selectItem(RoleEnum.NONE_SELECTED.getLabel());
                        selectedRole = RoleEnum.getEnumByLabel(listView.selectedItem as String);
                    }
                }
                rolePicker = XPicker {
                    layoutY: 209
                    disable: bind (user == null)
                    pickerType: XPickerType.DROP_DOWN
                    items: [RoleEnum.getLabels()]
                    onIndexChange: function (index: Integer) {
                        selectedRole = null;
                        listView.clearSelection();
                        selectedRole = RoleEnum.getEnumByLabel(rolePicker.selectedItem as String);
                    }
                }
                Button {
                    layoutX: 155
                    layoutY: 210
                    disable: bind (rolePicker.selectedItem == RoleEnum.NONE_SELECTED.getLabel())
                    id: "addButton"
                    text: "Add"
                    action: function () {
                        mediator.onAddRole(user, selectedRole);
                    }
                }
                Button {
                    layoutX: 200
                    layoutY: 210
                    disable: bind (selectedRole == null)
                    id: "removeButton"
                    text: "Remove"
                    action: function () {
                        mediator.onRemoveRole(user, selectedRole);
                    }
                }
            ]
        }
    }

}
