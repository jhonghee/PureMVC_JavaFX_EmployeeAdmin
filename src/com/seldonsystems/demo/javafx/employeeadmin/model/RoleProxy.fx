/*
 * RoleProxyFx.fx
 *
 * Created on Apr 14, 2010, 5:40:23 AM
 */
package com.seldonsystems.demo.javafx.employeeadmin.model;

import org.puremvc.java.multicore.patterns.proxy.Proxy;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.RoleVO;
import com.seldonsystems.demo.javafx.employeeadmin.model.enums.RoleEnum;
import com.seldonsystems.demo.javafx.employeeadmin.model.vo.UserVO;
import com.seldonsystems.demo.javafx.employeeadmin.ApplicationFacade;
import com.seldonsystems.demo.javafx.employeeadmin.model.RoleProxy.RoleListWrapper;

public def NAME: String = "RoleProxy";

/**
 * @author Jhonghee
 */
public class RoleProxy extends Proxy {

    init {
        init(NAME, RoleListWrapper {roles: []})
    }

    public function getRoles():RoleProxy.RoleListWrapper {
        return getData() as RoleProxy.RoleListWrapper;
    }


    // add an item to the data
    public function addItem(roleVO: RoleVO): Void {
        var roles: RoleVO[] = getRoles().roles;
        insert roleVO before roles[sizeof roles];

        getRoles().roles = roles;
    }

    // delete an item from the data
    public function deleteItem(item:RoleVO):Void {
        var roles: RoleVO[] = getRoles().roles;
        for(role in roles) {
            var roleVO:RoleVO = role as RoleVO;
            if (roleVO.getUsername().equals(item.getUsername())) {
                delete roleVO from roles;
                break;
            }
        }

        getRoles().roles = roles;
    }

    // determine if the user has a given role
    public function doesUserHaveRole(user:UserVO, role:RoleEnum):Boolean {
        var roles: RoleVO[] = getRoles().roles;
        var hasRole:Boolean = false;
        for (aRole in roles) {
            var roleVO:RoleVO = aRole as RoleVO;
            if (roleVO.getUsername().equals(user.getUsername())) {
                var userRoles:Object[] = roleVO.getRoles().toArray();
                for (userRole in userRoles) {
                    var roleEnum:RoleEnum = userRole as RoleEnum;
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
    public function addRoleToUser(user:UserVO, role:RoleEnum):Void {
        var roles: RoleVO[] = getRoles().roles;
        var result:Boolean = false;
        if (not doesUserHaveRole(user, role)) {
            for (aRole in roles) {
                var roleVO:RoleVO = aRole as RoleVO;
                if (roleVO.getUsername().equals(user.getUsername())) {
                    roleVO.getRoles().add(role);
                    result = true;
                    break;
                }
            }
        }
        getRoles().roles = roles;
        sendNotification(ApplicationFacade.ADD_ROLE_RESULT, result);
    }

    // remove a role from the user
    public function removeRoleFromUser(user:UserVO, role:RoleEnum):Void {
        var roles: RoleVO[] = getRoles().roles;
        if (doesUserHaveRole(user, role)) {
            for (aRole in roles) {
                var roleVO:RoleVO = aRole as RoleVO;
                if (roleVO.getUsername().equals(user.getUsername())) {
                        var userRoles:Object[] = roleVO.getRoles().toArray();
                    for (aUserRole in userRoles) {
                        var roleEnum:RoleEnum = aUserRole as RoleEnum;
                        if (roleEnum.equals(role)) {
                            roleVO.getRoles().remove(roleEnum);
                            break;
                        }
                    }
                    break;
                }
            }
        }
        getRoles().roles = roles;
    }

    // get a users roles
    public function getUserRoles(username:String):String[] {
        var roles: RoleVO[] = getRoles().roles;
        var userRoles:Object[] = [];
        for(aRole in roles) {
            var roleVO:RoleVO = aRole as RoleVO;
            if (roleVO.getUsername().equals(username)) {
                userRoles = roleVO.getRoles().toArray();
                break;
            }
        }

        var userRoleStrings:String[] = [];
        for(aUserRole in userRoles) {
            var userRole:RoleEnum = aUserRole as RoleEnum;
            insert userRole.getLabel() before userRoleStrings[sizeof userRoleStrings]
        }

        return userRoleStrings;
    }


}

public class RoleListWrapper {
    public var roles:RoleVO[];
}
