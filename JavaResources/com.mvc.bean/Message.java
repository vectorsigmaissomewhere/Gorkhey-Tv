package com.mvc.bean;

public class Message {
    private String username;
    private String messageTitle;
    private String messageDescription;
    
    public Message(String username, String messageTitle, String messageDescription) {
        this.setUsername(username);
        this.setMessageTitle(messageTitle);
        this.setMessageDescription(messageDescription);
    }

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getMessageTitle() {
		return messageTitle;
	}

	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}

	public String getMessageDescription() {
		return messageDescription;
	}

	public void setMessageDescription(String messageDescription) {
		this.messageDescription = messageDescription;
	}
    
    
}
