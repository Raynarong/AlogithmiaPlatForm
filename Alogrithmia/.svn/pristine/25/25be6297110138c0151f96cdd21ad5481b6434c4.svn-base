package com.web.file;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;

public class CallService {

	public String sendPost(String url, String param)
	{
		PrintWriter out = null;
		BufferedReader in = null;
		String result = "";
		
		
		try {
			
			URL realURL = new URL(url);
			URLConnection conn = realURL.openConnection();
			
			conn.setRequestProperty("accept", "*/*");
			conn.setRequestProperty("connection", "Keep-Alive");
			
			conn.setDoOutput(true);
			conn.setDoInput(true);
			
			out = new PrintWriter(conn.getOutputStream());
			out.print(param);
			out.flush();
			
			in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = null;
			while((line = in.readLine()) != null)
			{
				result += line;
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(out != null)
				out.close();
			if(in != null)
				try {
					in.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return result;
	}
	
}
