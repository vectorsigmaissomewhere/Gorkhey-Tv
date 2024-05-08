package com.mvc.bean;

public class CartBean {
    private String username;
    private String productName;
    private int quantity;
    private int price;

    public CartBean() {
        // Default constructor
    }

    public CartBean(String username, String productName, int quantity, int price) {
        this.username = username;
        this.productName = productName;
        this.quantity = quantity;
        this.price = price;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
