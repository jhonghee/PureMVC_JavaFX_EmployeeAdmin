/*
 * RolePanel.fx
 *
 * Created on Apr 6, 2010, 4:13:29 PM
 */
package org.puremvc.java.demos.javafx.employeeadmin.view.component;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.control.Label;
import javafx.scene.control.Button;
import org.jfxtras.scene.control.XPicker;
import org.jfxtras.scene.control.XPickerType;
import org.puremvc.java.demos.javafx.employeeadmin.model.enums.RoleEnum;
import javafx.scene.control.ListView;
import org.puremvc.java.demos.javafx.employeeadmin.model.vo.UserVO;
import javafx.scene.layout.VBox;
import javafx.scene.layout.HBox;
import javafx.geometry.HPos;
import javafx.scene.layout.LayoutInfo;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.control.ChoiceBox;

/**
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class RolePanel extends CustomNode {

    // Refs to view components
    var rolePanel: VBox;
    public var rolePicker: ChoiceBox;
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
                        rolePicker = ChoiceBox {
                            disable: bind (user == null)
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
