/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.seldonsystems.demo.javafx.employeeadmin.view.component.interfaces;

import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import com.seldonsystems.demo.javafx.employeeadmin.view.RolePanelMediator;
import java.util.List;

/**
 *
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public interface IRolePanel {

    public void setMediator(RolePanelMediator mediator);

    public void clearForm();

    public void setUser(UserVO userVO);

    public void setUserRoles(List<String> userRoles);

    public void reset();

}
