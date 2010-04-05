/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.seldonsystems.demo.javafx.employeeadmin.model;

import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import java.util.ArrayList;
import java.util.List;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

/**
 *
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public class UserProxy extends Proxy {

    public static final String NAME = "UserProxy";

    public UserProxy() {
        super(NAME, new ArrayList<UserVO>());
    }

    // return data property cast to proper type
    public List<UserVO> getUsers() {
        return (List<UserVO>)getData();
    }

    // Add an item to the data
    public void addItem(UserVO userVO) {
        getUsers().add(userVO);
    }

    // update an item in the data
    public void updateItem(UserVO userVO) {

        for (int i = 0; i < getUsers().size(); i++) {
            UserVO aUser = getUsers().get(i);
            if(aUser.getUsername().equals(userVO.getUsername())) {
                getUsers().remove(aUser);
                getUsers().add(i, aUser);
                break;
            }
        }
    }

    // delete an item in the data
    public void deleteItem(UserVO userVO) {
        for (int i = 0; i < getUsers().size(); i++) {
            UserVO aUser = getUsers().get(i);
            if(aUser.getUsername().equals(userVO.getUsername())) {
                getUsers().remove(aUser);
                break;
            }
        }
    }
}
