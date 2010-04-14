/*
 * UserForm.fx
 *
 * Created on Apr 6, 2010, 2:29:03 AM
 */
package org.puremvc.java.demos.javafx.employeeadmin.view.component;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.layout.VBox;
import javafx.scene.layout.HBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextBox;
import org.jfxtras.scene.control.XPicker;
import org.jfxtras.scene.control.XPickerType;
import org.jfxtras.scene.control.XPasswordBox;
import javafx.geometry.HPos;
import javafx.scene.control.Button;
import javafx.scene.layout.Tile;
import org.puremvc.java.demos.javafx.employeeadmin.model.enums.DeptEnum;
import org.puremvc.java.demos.javafx.employeeadmin.model.vo.UserVO;
import java.lang.String;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import org.puremvc.java.demos.javafx.employeeadmin.view.UserFormMediator;

/**
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class UserForm extends CustomNode {

    // Refs to view components
    public var updateButton: Button;
    public var cancelButton: Button;
    public var fnameField: TextBox;
    public var lnameField: TextBox;
    public var emailField: TextBox;
    public var usernameField: TextBox;
    public var passwordField: XPasswordBox;
    public var confirmedPasswordField: XPasswordBox;
    public var departmentField: XPicker;
    var userForm: VBox;
    // Mediators and models
    public var user: UserVO;
    // Bindinig variable
    public var username: String = "";
    public var fname: String = "";
    public var lname: String = "";
    public var email: String = "";
    public var password: String = "";
    public var confirmed: String = "";
    public var department: DeptEnum = DeptEnum.NONE_SELECTED;
    // States
    public var mode: String;

    override protected function create(): Node {
        userForm = VBox {
            spacing: 5
            content: [
                HBox {
                    hpos: HPos.LEFT
                    width: bind userForm.width
                    content: [
                        Label {
                            textFill: Color.NAVAJOWHITE
                            font: Font {
                                size: 14
                            }
                            text: "User Profile"
                        }
                    ]
                }
                Tile {
                    disable: bind if (user == null) true else false
                    columns: 2
                    rows: 7
                    vgap: 3
                    content: [
                        // First name
                        Label {
                            text: "First Name"
                        }
                        fnameField = TextBox {
                            text: bind fname with inverse
                        }
                        // Last name
                        Label {
                            text: "Last Name"
                        }
                        lnameField = TextBox {
                            text: bind lname with inverse
                        }
                        // Email
                        Label {
                            text: "Email"
                        }
                        emailField = TextBox {
                            text: bind email with inverse
                        }
                        // Username
                        Label {
                            text: "Username"
                        }
                        usernameField = TextBox {
                            text: bind username with inverse
                            disable: bind if (mode == UserFormMediator.MODE_EDIT) true else false
                        }
                        // Password
                        Label {
                            text: "Password"
                        }
                        passwordField = XPasswordBox {
                            text: bind password with inverse
                        }
                        // Confirm password
                        Label {
                            text: "Confirm Password"
                        }
                        confirmedPasswordField = XPasswordBox {
                            text: bind confirmed with inverse
                        }
                        // Department
                        Label {
                            text: "Department"
                        }
                        departmentField = XPicker {
                            pickerType: XPickerType.DROP_DOWN
                            items: [DeptEnum.getLabels()]
                        }
                    ]
                }
                HBox {
                    width: bind userForm.width
                    spacing: 5
                    hpos: HPos.RIGHT
                    content: [
                        updateButton = Button {
                            id: "updateProfileButton"
                            text: bind if (mode == UserFormMediator.MODE_ADD) "Add User" else "Update Profile"
                            disable: bind disableSubmit(username, password, confirmed, department)
                        }
                        cancelButton = Button {
                            id: "cancelButton"
                            text: "Cancel"
                            disable: bind if (user == null) true else false
                        }
                    ]
                }
            ]
        }
        return userForm;
    }



bound function disableSubmit(u:String, p:String, c:String, d:DeptEnum):Boolean {
        return (u == "") or (p != c) or (d.getLabel() == DeptEnum.NONE_SELECTED.getLabel());
    }

}
