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

/**
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
var stage: Stage = Stage {
            title: "PureMVC JavaFX Demo: EmployeeAdmin"
            scene: Scene {
                width: 800
                height: 600
                content: [
                    VBox {
                        height: bind stage.height
                        width: bind stage.width
                        vpos: VPos.CENTER
                        spacing: 20
                        content: [
                            UserList {
                               id: "userList"
                            }

                        ]
                    }
                ]
            }
        }
var applicationFacade: ApplicationFacade = ApplicationFacade.getInstance(ApplicationFacade.NAME);

applicationFacade.startup(stage.scene);