/*
 * Header.fx
 *
 * Created on Apr 14, 2010, 3:54:20 PM
 */
package org.puremvc.java.demos.javafx.employeeadmin.view.component;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.Group;
import javafx.scene.control.Label;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Color;

/**
 * @author Jhonghee
 */
public class Header extends CustomNode {

    public var width:Number;
    public var height:Number;

    override protected function create(): Node {
        return Group {
                    content: [
                            Rectangle {
                                width: bind width
                                height: bind height
                                fill: Color.WHITE
                            }

                        Label {
                            text: "Employee Admin"
                        }
                        Label {
                            text: "PureMVC JavaFX Demo"
                        }
                    ]
                }
    }

}
