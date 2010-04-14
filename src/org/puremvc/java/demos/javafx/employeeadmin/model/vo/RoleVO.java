/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package org.puremvc.java.demos.javafx.employeeadmin.model.vo;

import org.puremvc.java.demos.javafx.employeeadmin.model.enums.RoleEnum;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class RoleVO {

    private String username;
    private List<RoleEnum> roles = new ArrayList<RoleEnum>();

    public RoleVO(String username, List<RoleEnum> roles) {
        this.username = username;
        this.roles = roles;
    }

    public List<RoleEnum> getRoles() {
        return roles;
    }

    public String getUsername() {
        return username;
    }
}
