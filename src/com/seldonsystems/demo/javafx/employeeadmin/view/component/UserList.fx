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
import org.jfxtras.ext.swing.XSwingTable;
import org.jfxtras.ext.swing.table.ObjectSequenceTableModel;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import org.jfxtras.ext.swing.table.Row;
import org.jfxtras.ext.swing.table.StringCell;
import java.util.List;

/**
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class UserList extends CustomNode, IUserList {

    var mediator: UserListMediator;
    var users: Object[];

    override public function setMediator(mediator: UserListMediator): Void {
        this.mediator = mediator;
    }

    override public function setUsers (users : List) : Void {
        this.users = users.toArray();
    }

    override protected function create(): Node {
        return VBox {
                    width: 600
                    content: [
                        XSwingTable {
                            tableModel: ObjectSequenceTableModel {
                                override function transformEntry(entry) {
                                    def userVO: UserVO  = entry as UserVO;
                                    return Row {
                                                cells: [
                                                    StringCell { value: bind userVO.getUsername() }
                                                    StringCell { value: bind userVO.getFname() }
                                                    StringCell { value: bind userVO.getLname() }
                                                    StringCell { value: bind userVO.getEmail() }
                                                    StringCell { value: bind userVO.getDepartment().getLabel() }
                                                ]
                                            }
                                }
                                columnLabels: ["Username", "First Name", "Last Name", "Email", "Department"]
                                sequence: bind users;
                            } }
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
