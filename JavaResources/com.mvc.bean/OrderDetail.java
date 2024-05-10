package com.mvc.bean;

public class OrderDetail {
    private int orderId;
    private String username;
    private String productName;
    private int total;
    private String paymentMethod;
    private String transactionId;
    private String status;
    private String address;
    private String orderDate;
    private String deliveryDate;

    public OrderDetail(int orderId, String username, String productName, int total, String paymentMethod, String transactionId, String status, String address, String orderDate, String deliveryDate) {
        this.setOrderId(orderId);
        this.setUsername(username);
        this.setProductName(productName);
        this.setTotal(total);
        this.setPaymentMethod(paymentMethod);
        this.setTransactionId(transactionId);
        this.setStatus(status);
        this.setAddress(address);
        this.setOrderDate(orderDate);
        this.setDeliveryDate(deliveryDate);
    }
    
    public OrderDetail() {
    	super();
    }

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

}
