/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.seldonsystems.demo.javafx.employeeadmin.model;

import com.seldonsystems.demo.javafx.employeeadmin.ApplicationFacade;
import com.seldonsystems.demo.javafx.employeeadmin.model.enums.RoleEnum;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.RoleVO;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

/**
 *
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class RoleProxy extends Proxy {

    public static final String NAME = "RoleProxy";

    public RoleProxy() {
        super(NAME, new ArrayList<RoleVO>());
    }

    // get the data property cast to the appropriate type
    public List<RoleVO> getRoles() {
        return (List<RoleVO>) getData();
    }

    // add an item to the data
    public void addItem(RoleVO roleVO) {
        getRoles().add(roleVO);
    }

    // delete an item from the data
    public void deleteItem(RoleVO item) {
        for (Iterator<RoleVO> it = getRoles().iterator(); it.hasNext();) {
            RoleVO roleVO = it.next();
            if (roleVO.getUsername().equals(item.getUsername())) {
                getRoles().remove(roleVO);
                break;
            }
        }
    }

    // determine if the user has a given role
    public Boolean doesUserHaveRole(UserVO user, RoleEnum role) {
        Boolean hasRole = false;
        for (Iterator<RoleVO> it = getRoles().iterator(); it.hasNext();) {
            RoleVO roleVO = it.next();
            if (roleVO.getUsername().equals(user.getUsername())) {
                List<RoleEnum> userRoles = roleVO.getRoles();
                for (Iterator<RoleEnum> it1 = userRoles.iterator(); it1.hasNext();) {
                    RoleEnum roleEnum = it1.next();
                    if (roleEnum.equals(role)) {
                        hasRole = true;
                        break;
                    }
                }
                break;
            }
        }
        return hasRole;
    }

    // add a role to this user
    public void addRoleToUser(UserVO user, RoleEnum role) {
        Boolean result = false;
        if (!doesUserHaveRole(user, role)) {
            for (int i = 0; i < getRoles().size(); i++) {
                RoleVO roleVO = getRoles().get(i);
                if (roleVO.getUsername().equals(user.getUsername())) {
                    roleVO.getRoles().add(role);
                    result = true;
                    break;
                }
            }
        }
        sendNotification(ApplicationFacade.ADD_ROLE_RESULT, result);
    }

    // remove a role from the user
    public void removeRoleFromUser(UserVO user, RoleEnum role) {
        if (doesUserHaveRole(user, role)) {
            for (int i = 0; i < getRoles().size(); i++) {
                RoleVO roleVO = getRoles().get(i);
                if (roleVO.getUsername().equals(user.getUsername())) {
                    for (int j = 0; j < roleVO.getRoles().size(); j++) {
                        RoleEnum roleEnum = roleVO.getRoles().get(j);
                        if (roleEnum.equals(role)) {
                            roleVO.getRoles().remove(roleEnum);
                            break;
                        }
                    }
                    break;
                }
            }
        }
    }

    // get a users roles
    public List<String> getUserRoles(String username) {
        List<RoleEnum> userRoles = new ArrayList<RoleEnum>();
        for (Iterator<RoleVO> it = getRoles().iterator(); it.hasNext();) {
            RoleVO roleVO = it.next();
            if (roleVO.getUsername().equals(username)) {
                userRoles = roleVO.getRoles();
                break;
            }
        }
        List<String> userRoleStrings = new ArrayList<String>();
        for (Iterator<RoleEnum> it = userRoles.iterator(); it.hasNext();) {
            RoleEnum roleEnum = it.next();
            userRoleStrings.add(roleEnum.getLabel());
        }

        return userRoleStrings;
    }
}
