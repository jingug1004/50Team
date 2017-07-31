package sist.co.model;

public class MsgEvent {

	private String message;
	
	public MsgEvent() {}

	public MsgEvent(String message) {
		super();
		this.message = message;
	}

	@Override
	public String toString() {
		return "MsgEvent [message=" + message + "]";
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}