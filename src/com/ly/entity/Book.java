package com.ly.entity;

public class Book {
    private int book_id; // 图书id
    private String book_name; // 书名
    private String book_type; // 类型
    private String book_intro; // 简介
    private double book_money; // 价格
    private int book_volume; // 销量
    private String book_path; // 封面
    private int book_userid; // 用户id

    public Book() {
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getBook_type() {
        return book_type;
    }

    public void setBook_type(String book_type) {
        this.book_type = book_type;
    }

    public String getBook_intro() {
        return book_intro;
    }

    public void setBook_intro(String book_intro) {
        this.book_intro = book_intro;
    }

    public double getBook_money() {
        return book_money;
    }

    public void setBook_money(double book_money) {
        this.book_money = book_money;
    }

    public int getBook_volume() {
        return book_volume;
    }

    public void setBook_volume(int book_volume) {
        this.book_volume = book_volume;
    }

    public String getBook_path() {
        return book_path;
    }

    public void setBook_path(String book_path) {
        this.book_path = book_path;
    }

    public int getBook_userid() {
        return book_userid;
    }

    public void setBook_userid(int book_userid) {
        this.book_userid = book_userid;
    }

    @Override
    public String toString() {
        return "Book{" +
                "book_id=" + book_id +
                ", book_name='" + book_name + '\'' +
                ", book_type='" + book_type + '\'' +
                ", book_intro='" + book_intro + '\'' +
                ", book_money=" + book_money +
                ", book_volume=" + book_volume +
                ", book_path='" + book_path + '\'' +
                ", book_userid=" + book_userid +
                '}';
    }
}
