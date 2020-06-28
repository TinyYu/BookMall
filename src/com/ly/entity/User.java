package com.ly.entity;

public class User {
    private String username; // 用户名
    private String userpassword;  // 密码
    private String usereamil; // 邮箱
    private int userstatus;  // 身份 1顾客 2店长
    private int id; // 用户id
    private double usermoney; // 用户余额



    public User() {
    }

    public User(String username, String userpassword, String usereamil, int userstatus, double usermoney) {
        this.username = username;
        this.userpassword = userpassword;
        this.usereamil = usereamil;
        this.userstatus = userstatus;
        this.usermoney = usermoney;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

    public String getUsereamil() {
        return usereamil;
    }

    public void setUsereamil(String usereamil) {
        this.usereamil = usereamil;
    }

    public int getUserstatus() {
        return userstatus;
    }

    public void setUserstatus(int userstatus) {
        this.userstatus = userstatus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getUsermoney() {
        return usermoney;
    }

    public void setUsermoney(double usermoney) {
        this.usermoney = usermoney;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", userpassword='" + userpassword + '\'' +
                ", usereamil='" + usereamil + '\'' +
                ", userstatus=" + userstatus +
                ", id=" + id +
                ", usermoney=" + usermoney +
                '}';
    }
}
