/*
 * RolePanel.fx
 *
 * Created on Apr 6, 2010, 4:13:29 PM
 */
package com.seldonsystems.demo.javafx.employeeadmin.view.component;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import com.seldonsystems.demo.javafx.employeeadmin.view.RolePanelMediator;
import javafx.scene.layout.VBox;
import javafx.scene.layout.HBox;
import javafx.geometry.HPos;
import javafx.scene.control.Label;
import javafx.scene.control.Button;
import org.jfxtras.scene.control.XPicker;
import org.jfxtras.scene.control.XPickerType;
import com.seldonsystems.demo.javafx.employeeadmin.model.enums.RoleEnum;
import javafx.scene.control.ListView;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import java.util.List;
import javafx.scene.input.MouseEvent;

/**
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class RolePanel extends CustomNode, IRolePanel {

    // Refs to view components
    var rolePanel: VBox;
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
        rolePanel = VBox {
            spacing: 5
            content: [
                HBox {
                    hpos: HPos.LEFT
                    width: bind rolePanel.width
                    content: [
                        Label {
                            text: "User Roles"
                        }
                    ]
                }
                listView = ListView {
                    width: bind rolePanel.width
                    height: 400
                    items: bind userRoles
                    onMouseClicked: function (event: MouseEvent) {
                        rolePicker.selectItem(RoleEnum.NONE_SELECTED.getLabel());
                        selectedRole = RoleEnum.getEnumByLabel(listView.selectedItem as String);
                    }
                }
                HBox {
                    width: bind rolePanel.width
                    spacing: 5
                    hpos: HPos.RIGHT
                    content: [
                        rolePicker = XPicker {
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
                            disable: bind (rolePicker.selectedItem == RoleEnum.NONE_SELECTED.getLabel())
                            id: "addButton"
                            text: "Add"
                            action: function () {
                                mediator.onAddRole(user, selectedRole);
                            }
                        }
                        Button {
                            disable: bind (selectedRole == null)
                            id: "removeButton"
                            text: "Remove"
                            action: function () {
                                mediator.onRemoveRole(user, selectedRole);
                            }
                        }
                    ]
                }
            ]
        }
    }

}
