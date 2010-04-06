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
import com.seldonsystems.demo.javafx.employeeadmin.view.component.interfaces.IUserForm;
import com.seldonsystems.demo.javafx.employeeadmin.view.UserFormMediator;
import com.seldonsystems.demo.javafx.employeeadmin.model.enums.DeptEnum;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import java.lang.String;

/**
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class UserForm extends CustomNode, IUserForm {

    // Refs to view components
    var userForm: VBox;
    var fnameField: TextBox;
    var lnameField: TextBox;
    var emailField: TextBox;
    var usernameField: TextBox;
    var passwordField: XPasswordBox;
    var confirmedPasswordField: XPasswordBox;
    var departmentField: XPicker;
    // Mediators and models
    var mediator: UserFormMediator;
    var user: UserVO;
    // Bindinig variable
    var username:String = "";
    var fname:String = "";
    var lname:String = "";
    var email:String = "";
    var password:String = "";
    var confirmed:String = "";
    var department:DeptEnum = DeptEnum.NONE_SELECTED;
    // States
    var mode:String;

    override public function setMediator(mediator: UserFormMediator): Void {
        this.mediator = mediator;
    }

    override public function setUser (user : UserVO, mode : String) : Void {
        this.user = user;
        this.username = user.getUsername();
        this.fname = user.getFname();
        this.lname = user.getLname();
        this.email = user.getEmail();
        this.password = user.getPassword();
        this.confirmed = user.getPassword();
        this.department = user.getDepartment();

        this.mode = mode;

        // Unfortunately, XPicker does not have bindable property.
        departmentField.selectItem(user.getDepartment().getLabel());
    }

    override public function reset () : Void {
        user = null;
        username = "";
        fname = "";
        lname = "";
        email = "";
        password = "";
        confirmed = "";
        department = DeptEnum.NONE_SELECTED;
        departmentField.selectItem(DeptEnum.NONE_SELECTED.getLabel());
    }

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
                    disable: bind if( user == null ) true else false
                    columns: 2
                    rows: 7
                    vgap: 3
                    content: [
                        // First name
                        Label {
                            text: "First Name"
                        }
                        fnameField = TextBox {
                                text:bind fname with inverse
                            }
                        // Last name
                        Label {
                            text: "Last Name"
                        }
                        lnameField = TextBox {
                                text:bind lname with inverse
                            }
                        // Email
                        Label {
                            text: "Email"
                        }
                        emailField = TextBox {
                                text:bind email with inverse
                            }
                        // Username
                        Label {
                            text: "Username"
                        }
                        usernameField = TextBox {
                                text:bind username with inverse
                            }
                        // Password
                        Label {
                            text: "Password"
                        }
                        passwordField = XPasswordBox {
                                text:bind password with inverse
                            }
                        // Confirm password
                        Label {
                            text: "Confirm Password"
                        }
                        confirmedPasswordField = XPasswordBox {
                                text:bind confirmed with inverse
                            }
                        // Department
                        Label {
                            text: "Department"
                        }
                        departmentField = XPicker {
                            pickerType: XPickerType.DROP_DOWN
                            items: [DeptEnum.getLabels()]
                            onIndexChange: function(index:Integer) {
                                department = DeptEnum.getEnumByLabel(departmentField.selectedItem as String);
                            }

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
                            text: bind if (mode == IUserForm.MODE_ADD) "Add User" else "Update Profile"
                            disable: bind disableSubmit(username, password, confirmed, department)
                            action: function () {

                            }
                        }
                        Button {
                            id: "cancelButton"
                            text: "Cancel"
                            disable: bind if( user == null ) true else false
                            action: function () {
                                reset();
                                mediator.onCancel();
                            }
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
