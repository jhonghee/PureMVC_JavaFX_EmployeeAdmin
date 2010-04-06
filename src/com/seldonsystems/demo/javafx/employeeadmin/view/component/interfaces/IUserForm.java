/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.seldonsystems.demo.javafx.employeeadmin.view.component.interfaces;

import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import com.seldonsystems.demo.javafx.employeeadmin.view.UserFormMediator;

/**
 *
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public interface IUserForm {

    public static final String MODE_ADD = "modeAdd";
    public static final String MODE_EDIT = "modeEdit";

    public void setMediator(UserFormMediator mediator);

    public void setUser(UserVO user, String mode);

    public void reset();


}
