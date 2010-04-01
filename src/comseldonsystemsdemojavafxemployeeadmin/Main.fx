/*
 * Main.fx
 *
 * Created on Apr 1, 2010, 3:39:33 PM
 */

package comseldonsystemsdemojavafxemployeeadmin;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.Text;
import javafx.scene.text.Font;

/**
 * @author remotejpark
 */

Stage {
    title: "PureMVC EmployeeAdmin JavaFX Demo"
    scene: Scene {
        width: 250
        height: 80
        content: [
            Text {
                font : Font {
                    size : 16
                }
                x: 10
                y: 30
                content: "JavaFX Demo"
            }
        ]
    }
}