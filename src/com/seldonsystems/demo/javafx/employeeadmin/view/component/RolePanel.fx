/*
 * RolePanel.fx
 *
 * Created on Apr 6, 2010, 4:13:29 PM
 */
package com.seldonsystems.demo.javafx.employeeadmin.view.component;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.control.Label;
import javafx.scene.control.Button;
import org.jfxtras.scene.control.XPicker;
import org.jfxtras.scene.control.XPickerType;
import com.seldonsystems.demo.javafx.employeeadmin.model.enums.RoleEnum;
import javafx.scene.control.ListView;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import javafx.scene.layout.VBox;
import javafx.scene.layout.HBox;
import javafx.geometry.HPos;
import javafx.scene.layout.LayoutInfo;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;

/**
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class RolePanel extends CustomNode {

    // Refs to view components
    var rolePanel: VBox;
    public var rolePicker: XPicker;
    public var listView: ListView;
    public var addButton: Button;
    public var removeButton: Button;
    // Models
    public var user: UserVO;
    public var userRoles: Object[];
    public var selectedRole: RoleEnum;

    override protected function create(): Node {
        rolePanel = VBox {
            spacing: 5
            content: [
                Label {
                    textFill: Color.NAVAJOWHITE
                    font: Font {
                        size: 14
                    }
                    text: "User Roles"
                }
                listView = ListView {
                    layoutInfo: LayoutInfo {
                        width: 270
                        height: 185
                    }
                    items: bind userRoles
                }
                HBox {
                    spacing: 5
                    hpos: HPos.RIGHT
                    content: [
                        rolePicker = XPicker {
                            disable: bind (user == null)
                            pickerType: XPickerType.DROP_DOWN
                            items: [RoleEnum.getLabels()]
                        }
                        addButton = Button {
                            disable: bind (rolePicker.selectedItem == RoleEnum.NONE_SELECTED.getLabel())
                            id: "addButton"
                            text: "Add"
                        }
                        removeButton = Button {
                            disable: bind (selectedRole == null)
                            id: "removeButton"
                            text: "Remove"
                        }
                    ]
                }
            ]
        }
    }

}
