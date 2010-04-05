/*
 * UserList.fx
 *
 * Created on Apr 4, 2010, 8:52:55 AM
 */
package com.seldonsystems.demo.javafx.employeeadmin.view.component;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import com.seldonsystems.demo.javafx.employeeadmin.view.UserListMediator;
import javafx.scene.layout.VBox;
import javafx.scene.layout.HBox;
import javafx.scene.control.Button;
import javafx.geometry.HPos;

/**
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class UserList extends CustomNode, IUserList {

    var mediator: UserListMediator;

    override public function setMediator(mediator: UserListMediator): Void {
        this.mediator = mediator;
    }

    override protected function create(): Node {
        return VBox {                
                    width:600
                    content: [
                        HBox {
                            hpos: HPos.RIGHT
                            spacing: 10
                            content: [
                                Button {
                                    text: "Delete"
                                    action: function () {
                                        mediator.onDelete()
                                    }
                                }
                                Button {
                                    text: "New"
                                    action: function () {
                                        mediator.onNew()
                                    }
                                }
                            ]
                        }
                    ]
                };
    }

}
