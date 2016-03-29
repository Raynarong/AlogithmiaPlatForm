package com.web.test;

import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.googlecode.jsonrpc4j.JsonRpcHttpClient;

public class TestType {
	
	private String url;
	private String location;
	
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

	public TestType(String url, String location)
	{
		this.url = url;
		this.location = location;
	}
	
	public String callType() throws Throwable {
		JsonRpcHttpClient client = new JsonRpcHttpClient(new URL(url));
		Map<String, String> headers = new HashMap<String, String>();
		headers.put("name", "剑白");
		client.setHeaders(headers);
		Object[] arr = {location};
		System.out.println(arr[0]);
		Object properties = client.invoke("ReturnParaMeter", arr, Object.class);
		System.out.println(properties);
		return properties.toString();
	}

	public static void main(String[] args) throws Throwable {
		TestType test = new TestType("http://192.168.0.114:8080/AlogServer/servlet/HelloworldServlet", "renee.javatest.javatest");
		String result = test.callType();
		JSONObject json = JSONObject.fromObject(result);
		System.out.println(json.get("returnParameter"));
		System.out.println(json.get("returnType"));
	}
	
}
