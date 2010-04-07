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
import org.jfxtras.ext.swing.XSwingTable;
import org.jfxtras.ext.swing.table.ObjectSequenceTableModel;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import org.jfxtras.ext.swing.table.Row;
import org.jfxtras.ext.swing.table.StringCell;
import java.util.List;
import org.jfxtras.ext.swing.table.ListSelectionMode;
import javafx.geometry.HPos;
import javafx.scene.control.Label;
import javafx.scene.text.Font;
import javafx.ext.swing.SwingScrollPane;

/**
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class UserList extends CustomNode, IUserList {

    // Refs to view components
    var userListNode: VBox;
    var swingTable: XSwingTable;
    var scroll:SwingScrollPane;
    // Mediators and Models
    var mediator: UserListMediator;
    var users: Object[];
    // Binding variables
    var disableDelete: Boolean = true;
    // States
    var selectedIndex: Integer = -1;

    override public function setMediator(mediator: UserListMediator): Void {
        this.mediator = mediator;
    }

    override public function setUsers(users: List): Void {
        this.users = users.toArray();
    }

    override public function deSelect(): Void {
        swingTable.getJTable().clearSelection();
    }

    override protected function create(): Node {
        userListNode = VBox {
            nodeHPos: HPos.CENTER
            hpos: HPos.CENTER
            spacing: 5
            content: [
                HBox {
                    width: bind userListNode.width
                    content: [
                        Label {
                            font: Font {
                                size: 12
                            }
                            text: "Users"
                        }
                    ]
                }
                scroll = SwingScrollPane {
                    view: swingTable = XSwingTable {
                        tableModel: ObjectSequenceTableModel {
                            override function transformEntry(entry)                                                 {
                                def userVO: UserVO = entry as UserVO;
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
                        }
                        preferredColumnWidths: [100, 100, 100, 200, 100]
                        rowSelectionMode: ListSelectionMode.SINGLE_SELECTION
                        onSelectedRowsChanged: function (selected: Integer[]) {
                            if (sizeof selected > 0) {
                                disableDelete = false;
                                selectedIndex = selected[0];
                                mediator.onSelect(users[selectedIndex] as UserVO);
                            } else {
                                disableDelete = true;
                            }
                        }
                    }
                }
                HBox {
                    width: bind userListNode.width
                    spacing: 5
                    hpos: HPos.RIGHT
                    content: [
                        Button {
                            id: "deleteButton"
                            text: "Delete"
                            disable: bind disableDelete
                            action: function () {
                                if (selectedIndex != -1) {
                                    mediator.onDelete(users[selectedIndex] as UserVO)
                                }
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
        }
        return userListNode;
    }
}
