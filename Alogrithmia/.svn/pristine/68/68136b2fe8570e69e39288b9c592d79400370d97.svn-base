package com.xl.frame.common.util;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class Base64Utils {
	
	public static String encoder (String str) {
		byte[] b = str.getBytes();
		return (new BASE64Encoder()).encodeBuffer(b);
	}
	
	public static String decoder (String str) throws Exception {
		byte[] b = (new BASE64Decoder()).decodeBuffer(str);
		return new String(b, "UTF-8");
	}
	
}
