package com.reshop.action;

public class ActionForward {
	//true 면 redirect / false 면 forward
	private boolean isRedirect;
	//이동할 경로
	private String path;
	
	public ActionForward() {}
	
	public ActionForward(boolean isRedirect, String path) {
		this.isRedirect = isRedirect;
		this.path = path;
	}

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
}
