/*
 * Main.fx
 *
 * Created on Apr 1, 2010, 3:39:33 PM
 */
package com.seldonsystems.demo.javafx.employeeadmin;

import javafx.stage.Stage;
import javafx.scene.Scene;
import com.seldonsystems.demo.javafx.employeeadmin.view.component.UserList;
import com.seldonsystems.demo.javafx.employeeadmin.view.component.UserForm;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import com.seldonsystems.demo.javafx.employeeadmin.view.component.RolePanel;
import javafx.scene.layout.VBox;
import javafx.scene.layout.HBox;

/**
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */

function run() {

    var mainFrame:MainFrame = MainFrame {
            title:   "PureMVC JavaFX Demo: EmployeeAdmin"
            width: 620
            height: 660
            scene: Scene {
                fill: LinearGradient {
                    startX: 0.0, startY: 1.0, endX: 0.0, endY: 0.0,
                    proportional: true
                    stops: [
                        Stop { offset: 0.0 color: Color.web("#99ddff") },
                        Stop { offset: 1.0 color: Color.web("#337799") }
                    ]
                }
                content: [
                    VBox {
                        layoutX: 10
                        layoutY: 10
                        spacing: 10
                        content: [
                            UserList { id: "userList" }
                            HBox {
                                spacing: 10
                                content: [
                                    UserForm { id: "userForm" }
                                    RolePanel { id: "rolePanel" }
                                ]
                            }
                        ]
                    }
                ]
            }
    }


    var applicationFacade: ApplicationFacade = ApplicationFacade {
                key: ApplicationFacade.NAME
            }

    applicationFacade.startup(mainFrame);

}

public class MainFrame extends Stage {
    public var userList:UserList;
    public var userForm:UserForm;
    public var rolePanel:RolePanel;

    postinit {
        userList = scene.lookup("userList") as UserList;
        userForm = scene.lookup("userForm") as UserForm;
        rolePanel = scene.lookup("rolePanel") as RolePanel;
    }

}
