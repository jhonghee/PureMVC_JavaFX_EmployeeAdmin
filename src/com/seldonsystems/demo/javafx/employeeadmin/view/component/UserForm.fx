/*
 * UserForm.fx
 *
 * Created on Apr 6, 2010, 2:29:03 AM
 */
package com.seldonsystems.demo.javafx.employeeadmin.view.component;

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

/**
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class UserForm extends CustomNode {

    var disableUpdateProfile: Boolean = true;
    var disableCancel: Boolean = true;
    var userForm: VBox;

    override protected function create(): Node {
        userForm = VBox {
            spacing: 5
            content: [
                HBox {
                    hpos: HPos.LEFT
                    width: bind userForm.width
                    content: [
                        Label {
                            text: "User Profile"
                        }
                    ]
                }
                Tile {
                    columns: 2
                    rows: 7
                    vgap: 3
                    content: [
                        // First name
                        Label {
                            text: "First Name"
                        }
                        TextBox {
                        }
                        // Last name
                        Label {
                            text: "Last Name"
                        }
                        TextBox {
                        }
                        // Email
                        Label {
                            text: "Email"
                        }
                        TextBox {
                        }
                        // Username
                        Label {
                            text: "Username"
                        }
                        TextBox {
                        }
                        // Password
                        Label {
                            text: "Password"
                        }
                        XPasswordBox {
                        }
                        // Confirm password
                        Label {
                            text: "Confirm Password"
                        }
                        XPasswordBox {
                        }
                        // Department
                        Label {
                            text: "Department"
                        }
                        XPicker {
                            pickerType: XPickerType.DROP_DOWN
                        }
                    ]
                }
                HBox {
                    width: bind userForm.width
                    spacing: 5
                    hpos: HPos.RIGHT
                    content: [
                        Button {
                            id: "updateProfileButton"
                            text: "Update"
                            disable: bind disableUpdateProfile
                            action: function () {

                            }
                        }
                        Button {
                            id: "cancelButton"
                            text: "Cancel"
                            disable: bind disableCancel
                            action: function () {

                            }
                        }
                    ]
                }
            ]
        }
        return userForm;
    }

}
