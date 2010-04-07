/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.seldonsystems.demo.javafx.employeeadmin.model.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 *
 * @author Jhonghee Park @ Seldon Systems, Inc.
 */
public enum RoleEnum {

    NONE_SELECTED("--None Selected--", -1),
    ADMIN("Administrator", 0),
    ACCT_PAY("Accounts Payable", 1),
    ACCT_RCV("Accounts Receivable", 2),
    EMP_BENEFITS("Employee Benefits", 3),
    GEN_LEDGER("General Ledger", 4),
    PAYROLL("Payroll", 5),
    INVENTORY("Inventory", 6),
    PRODUCTION("Production", 7),
    QUALITY_CTL("Quality Control", 8),
    SALES("Sales", 9),
    ORDERS("Orders", 10),
    CUSTOMERS("Customers", 11),
    SHIPPING("Shipping", 12),
    RETURNS("Returns", 13);
    private static final Map<String, RoleEnum> enumMap = new TreeMap<String, RoleEnum>();

    static {
        for (RoleEnum dept : values()) {
            enumMap.put(dept.getLabel(), dept);
        }
    }
    private String label;
    private int value;

    private RoleEnum(String label, int value) {
        this.label = label;
        this.value = value;
    }

    public String getLabel() {
        return label;
    }

    public int getValue() {
        return value;
    }

    public static String[] getLabels() {
        return enumMap.keySet().toArray(new String[enumMap.size()]);
    }

    public static RoleEnum getEnumByLabel(String label) {
        return enumMap.get(label);
    }
}
