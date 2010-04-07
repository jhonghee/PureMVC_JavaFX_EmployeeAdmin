/*
 * Main.fx
 *
 * Created on Apr 1, 2010, 3:39:33 PM
 */
package com.seldonsystems.demo.javafx.employeeadmin;

import javafx.stage.Stage;
import javafx.scene.Scene;
import com.seldonsystems.demo.javafx.employeeadmin.ApplicationFacade;
import javafx.scene.layout.VBox;
import javafx.geometry.VPos;
import com.seldonsystems.demo.javafx.employeeadmin.view.component.UserList;
import javafx.geometry.HPos;
import javafx.scene.layout.HBox;
import com.seldonsystems.demo.javafx.employeeadmin.view.component.UserForm;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import com.seldonsystems.demo.javafx.employeeadmin.view.component.RolePanel;

/**
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
var stage: Stage = Stage {
            title: "PureMVC JavaFX Demo: EmployeeAdmin"
            scene: Scene {
                fill: LinearGradient {
                    startX: 0.0, startY: 1.0, endX: 0.0, endY: 0.0,
                    proportional: true
                    stops: [
                        Stop { offset: 0.0 color: Color.web("#99ddff") },
                        Stop { offset: 1.0 color: Color.web("#337799") }
                    ]
                }
                width: 800
                height: 800
                content: [
                    VBox {
                        width: bind stage.width
                        nodeHPos: HPos.CENTER
                        hpos: HPos.CENTER
                        spacing: 20
                        content: [
                            UserList {
                                id: "userList"
                            }
                            HBox {
                                    spacing: 10
                                content: [
                                    UserForm {
                                        id: "userForm"
                                    }
                                    RolePanel {
                                        id: "rolePanel"
                                    }
                                ]
                            }
                        ]
                    }
                ]
            }
        }
var applicationFacade: ApplicationFacade = ApplicationFacade.getInstance(ApplicationFacade.NAME);

applicationFacade.startup(stage.scene);
