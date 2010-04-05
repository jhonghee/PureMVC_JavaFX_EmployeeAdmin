/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.seldonsystems.demo.javafx.employeeadmin.model.enums;

/**
 *
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public enum DeptEnum {

    NONE_SELECTED ("--None Selected--", -1),
    ACCT ("Accounting", 0),
    SALES ("Sales", 1),
    PLANT ("Plant", 2),
    SHIPPING ("Shipping", 3),
    QC ("Quality Control", 4);

    private String label;

    private int value;

    private DeptEnum(String label, int value) {
        this.label = label;
        this.value = value;
    }

    public String getLabel() {
        return label;
    }

    public int getValue() {
        return value;
    }

    
}
