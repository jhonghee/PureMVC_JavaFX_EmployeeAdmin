/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.seldonsystems.demo.javafx.employeeadmin.view.component;

import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import com.seldonsystems.demo.javafx.employeeadmin.view.UserListMediator;
import java.util.List;

/**
 *
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public interface IUserList {

    public void setMediator(UserListMediator mediator);

    public void setUsers(List<UserVO> users);
}
