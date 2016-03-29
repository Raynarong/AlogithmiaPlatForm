package com.web.test;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.googlecode.jsonrpc4j.JsonRpcHttpClient;

public class TestClient {
	
	private String url;
	
	private String location;
	
	private String data;
	
	private String caller;
	
	private String callType;
	
	private String callIp;
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getCaller() {
		return caller;
	}

	public void setCaller(String caller) {
		this.caller = caller;
	}

	public String getCallType() {
		return callType;
	}

	public void setCallType(String callType) {
		this.callType = callType;
	}

	public String getCallIp() {
		return callIp;
	}

	public void setCallIp(String callIp) {
		this.callIp = callIp;
	}

	public TestClient(String url, String location, String data, String caller, String callType, String callIp)
	{
		this.url = url;
		this.location = location;
		this.data = data;
		this.caller = caller;
		this.callType = callType;
		this.callIp = callIp;
	}
	
	public String callTest() throws Throwable {
		JsonRpcHttpClient client = new JsonRpcHttpClient(new URL(url));
		Map<String, String> headers = new HashMap<String, String>();
		headers.put("name", "剑白");
		client.setHeaders(headers);
		// JSONObject json = new JSONObject();
		// json.put("username", user.getUsername());
		// json.put("number", user.getNumber());
		// json.put("age", user.getAge());
//		String location = "add";
//		String json = "[10,5]";
		Object[] arr = {location, data, caller, callType, callIp};
		System.out.println(arr[0]);
		System.out.println(arr[1]);
		// JSONObject properties = client.invoke("getSystemProperties", arr,
		// JSONObject.class);
		Object properties = client.invoke("invokeMethod", arr, Object.class);
		System.out.println(properties);
		return properties.toString();
	}

}
