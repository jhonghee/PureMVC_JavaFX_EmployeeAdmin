/*
 * UserProxyFx.fx
 *
 * Created on Apr 14, 2010, 5:12:33 AM
 */
package org.puremvc.java.demos.javafx.employeeadmin.model;

import org.puremvc.java.multicore.patterns.proxy.Proxy;
import org.puremvc.java.demos.javafx.employeeadmin.model.vo.UserVO;
import org.puremvc.java.demos.javafx.employeeadmin.model.UserProxy.UserListWrapper;

/**
 * @author Jhonghee
 */
public def NAME: String = "UserProxy";

public class UserProxy extends Proxy {

    init {
        init(NAME, UserProxy.UserListWrapper { users: [] })
    }

    public function getUsers():UserListWrapper {
        return getData() as UserProxy.UserListWrapper;
    }
    
    // Add an item to the data
    public function addItem(userVO: UserVO): Void {
        var users: UserVO[] = getUsers().users;
        insert userVO before users[sizeof users];

        getUsers().users = users;
    }

    // update an item in the data
    public function updateItem(userVO:UserVO):Void {
        var users:UserVO[] = getUsers().users;

        var i:Integer = 0;
        for (user in users ) {
            var aUser:UserVO = user as UserVO;
            if(aUser.getUsername().equals(userVO.getUsername())) {
                    insert userVO before users[i];
                    delete aUser from users;
                break;
            }
            i++;
        }

        getUsers().users = users;

    }

    // delete an item in the data
    public function deleteItem(userVO:UserVO):Void {
        var users:UserVO[] = getUsers().users;

        for(user in users) {
           var aUser:UserVO = user as UserVO;
            if(aUser.getUsername().equals(userVO.getUsername())) {
                    delete aUser from users;
                break;
            }
        }

        getUsers().users = users;

    }

}

public class UserListWrapper {
    public var users:UserVO[];
}
