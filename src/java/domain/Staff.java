/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

/**
 *
 * @author Ruey
 */
public class Staff {

    private String staffID;
    private String staffFirstName;
    private String stafflastName;
    private int staffAge;
    private char gender;
    private int phoneNo;
    private int roleID;
    private String roleDesc;
    private String joinDate;
    private int workingDays;

    public Staff() {

    }

    public Staff(String staffID, String staffFirstName, String stafflastName, int staffAge, char gender, int phoneNo, int roleID, String roleDesc, String joinDate, int workingDays) {
        this.staffID = staffID;
        this.staffFirstName = staffFirstName;
        this.stafflastName = stafflastName;
        this.staffAge = staffAge;
        this.gender = gender;
        this.phoneNo = phoneNo;
        this.roleID = roleID;
        this.roleDesc = roleDesc;
        this.joinDate = joinDate;
        this.workingDays = workingDays;
    }

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }

    public String getStaffFirstName() {
        return staffFirstName;
    }

    public void setStaffFirstName(String staffFirstName) {
        this.staffFirstName = staffFirstName;
    }

    public String getStafflastName() {
        return stafflastName;
    }

    public void setStafflastName(String stafflastName) {
        this.stafflastName = stafflastName;
    }

    public int getStaffAge() {
        return staffAge;
    }

    public void setStaffAge(int staffAge) {
        this.staffAge = staffAge;
    }

    public char getGender() {
        return gender;
    }

    public void setGender(char gender) {
        this.gender = gender;
    }

    public int getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(int phoneNo) {
        this.phoneNo = phoneNo;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }

    public String getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(String joinDate) {
        this.joinDate = joinDate;
    }

    public int getWorkingDays() {
        return workingDays;
    }

    public void setWorkingDays(int workingDays) {
        this.workingDays = workingDays;
    }

    @Override
    public String toString() {
        return "Staff{" + "staffID=" + staffID + ", staffFirstName=" + staffFirstName + ", stafflastName=" + stafflastName + ", staffAge=" + staffAge + ", gender=" + gender + ", phoneNo=" + phoneNo + ", roleID=" + roleID + ", roleDesc=" + roleDesc + ", joinDate=" + joinDate + ", workingDays=" + workingDays + '}';
    }

}
