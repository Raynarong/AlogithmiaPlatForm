package alg.base.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

public class ZipUtils {

	/**
	 * 将sourceFilePath下的文件，打包成fileName命名的zip文件，存储到zipFilePath
	 * @param sourceFilePath 待压缩路径，到.java
	 * @param zipFilePath 压缩后路径，zip所在文件夹
	 * @param fileName 压缩后文件名（不用带后缀名）
	 */
	public static void fileToZip(String sourceFilePath, String zipFilePath, String fileName){
		File sourceFile = new File(sourceFilePath);
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		FileOutputStream fos = null;
		ZipOutputStream zos = null;
		
		if(sourceFile.exists() == false)
		{
			System.out.println("待压缩文件目录：" + sourceFilePath + "不存在");
		}
		else
		{
			try{
				File zipFile = new File(zipFilePath + "/" + fileName + ".zip");
				fos = new FileOutputStream(zipFile);
				zos = new ZipOutputStream(new BufferedOutputStream(fos));
				byte[] bufs = new byte[1024*10];
				// 创建ZIP实体,并添加进压缩包  
				ZipEntry zipEntry = new ZipEntry(sourceFile.getName());
				zos.putNextEntry(zipEntry);
				// 读取待压缩的文件并写进压缩包里
				fis = new FileInputStream(sourceFile);
				bis = new BufferedInputStream(fis, 1024*10);
				int read = 0;
				while((read = bis.read(bufs, 0, 1024*10)) != -1)
				{
					zos.write(bufs, 0, read);
				}
			}catch (Exception e){
				e.printStackTrace();
			}finally{
				try {
					if(null != bis)
						bis.close();
					if(null != zos)
						zos.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
	}
	
	/**
	 * 将zip文件解压到targetPath目录下
	 * @param zipFilePath zip文件地址，到.zip
	 * @param targetPath 解压缩目录
	 */
	public static void zipToFile(String zipFilePath, String targetPath){
		OutputStream os = null;
		InputStream is = null;
		ZipFile zipFile = null;
		try {
			zipFile = new ZipFile(zipFilePath);
			String directoryPath = "";
			if(null == targetPath || "".equals(targetPath))
			{
				directoryPath = zipFilePath.substring(0, zipFilePath.lastIndexOf("."));
			}
			else
			{
				directoryPath = targetPath;
			}
			Enumeration entryEnum = zipFile.entries();
			if(null != entryEnum)
			{
				ZipEntry zipEntry = null; 
				while(entryEnum.hasMoreElements())
				{
					zipEntry = (ZipEntry) entryEnum.nextElement();
					if(zipEntry.isDirectory())
					{
						directoryPath = directoryPath + File.separator + zipEntry.getName();
						System.out.println(directoryPath);
						continue;
					}
					if(zipEntry.getSize() > 0)
					{
						File targetFile = buildFile(directoryPath + File.separator + zipEntry.getName(), false);
						os = new BufferedOutputStream(new FileOutputStream(targetFile));
						is = zipFile.getInputStream(zipEntry);
						byte[] buffer = new byte[4096];
						int readLen = 0;
						while((readLen = is.read(buffer, 0, 4096)) >= 0)
						{
							os.write(buffer, 0, readLen);
						}
						os.flush();
						os.close();
					}
					else
					{
						//空目录
						buildFile(directoryPath + File.separator + zipEntry.getName(), true);
					}
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(null != zipFile)
				{
					zipFile.close();
				}
				if(null != is)
				is.close();
				if(null != os)
				{
					os.close();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 生成文件的方法类
	 * @param fileName
	 * @param isDirectory
	 * @return
	 */
	public static File buildFile(String fileName, boolean isDirectory)
	{
		File target = new File(fileName);
		if(isDirectory)
		{
			target.mkdirs();
		}
		else
		{
			if(!target.getParentFile().exists())
			{
				target.getParentFile().mkdirs();
				target = new File(target.getAbsolutePath());
			}
		}
		return target;
	}
	
	public static void main(String[] args) {
		String sourceFilePath = "C:\\jsoup-1.8.2.jar";  
        String zipFilePath = "C:\\testsave";  
        String fileName = "jsoup-1.8.2";
//        ZipUtils.fileToZip(sourceFilePath, zipFilePath, fileName);
        ZipUtils.zipToFile(zipFilePath + "/" + fileName + ".zip", "C:\\testsave");
	}
}
