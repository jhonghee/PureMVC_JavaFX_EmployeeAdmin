/*
 * UserList.fx
 *
 * Created on Apr 4, 2010, 8:52:55 AM
 */
package org.puremvc.java.demos.javafx.employeeadmin.view.component;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.layout.VBox;
import javafx.scene.layout.HBox;
import javafx.scene.control.Button;
import org.jfxtras.ext.swing.XSwingTable;
import org.jfxtras.ext.swing.table.ObjectSequenceTableModel;
import org.puremvc.java.demos.javafx.employeeadmin.model.vo.UserVO;
import org.jfxtras.ext.swing.table.Row;
import org.jfxtras.ext.swing.table.StringCell;
import javafx.geometry.HPos;
import javafx.scene.control.Label;
import javafx.scene.text.Font;
import javafx.scene.layout.LayoutInfo;
import javafx.scene.paint.Color;
import org.jfxtras.ext.swing.table.ListSelectionMode;

/**
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class UserList extends CustomNode {

    // Refs to view components
    var userListNode: VBox;
    public var swingTable: XSwingTable;
    public var deleteButton: Button;
    public var newButton: Button;
    // Models
    public var users: Object[];
    // Binding variables
    public var disableDelete: Boolean = true;
    // States
    public var selectedIndex: Integer = -1;

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
                            textFill: Color.NAVAJOWHITE
                            font: Font {
                                size: 14
                            }
                            text: "Users"
                        }
                    ]
                }
                    swingTable = XSwingTable {
                        layoutInfo: LayoutInfo { width: 580 height: 200 }
                        tableModel: ObjectSequenceTableModel {
                            override function transformEntry(entry) {
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
                    }
                
                HBox {
                    width: bind userListNode.width
                    spacing: 5
                    hpos: HPos.RIGHT
                    content: [
                        deleteButton = Button {
                            id: "deleteButton"
                            text: "Delete"
                            disable: bind disableDelete
                        }
                        newButton = Button {
                            text: "New"
                        }
                    ]
                }
            ]
        }
        return userListNode;
    }

}
