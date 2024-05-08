package com.mvc.bean;

public class ProductBean {
	private int productId;
	private String productName;
	private String productDescription;
	private String productPrice;
	private int productStock;
	private String productActive;
	private String imageName;
	private byte[] imageData;
	private String base64Image;
	
	public ProductBean() {
		super();
	}
	public int getProductId() {
		return productId;
	}
	
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductStock() {
        return productStock;
    }

    public void setProductStock(int productStock) {
        this.productStock = productStock;
    }

    public String getProductActive() {
        return productActive;
    }

    public void setProductActive(String productActive) {
        this.productActive = productActive;
    }

    public String getFileName() {
        return imageName;
    }

    public void setFileName(String imageName) {
        this.imageName = imageName;
    }

    public byte[] getImageData() {
        return imageData;
    }

    public void setImageData(byte[] imageData) {
        this.imageData = imageData;
    }
    
    public String getBase64Image() {
        return base64Image;
    }

    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }
}

