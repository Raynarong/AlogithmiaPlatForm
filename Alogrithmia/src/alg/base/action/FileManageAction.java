package alg.base.action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.channels.FileChannel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import alg.base.bean.Collection;
import alg.base.bean.MyFile;
import alg.base.util.DatabaseTool;

import com.opensymphony.xwork2.ActionSupport;

public class FileManageAction extends ActionSupport{

	private String collectionName;
	private int collectionId;
	
	private File file;
	private String fileFileName;
	private String fileContentType;
	
	private String flag;
	private String url;
	
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getCollectionName() {
		return collectionName;
	}

	public void setCollectionName(String collectionName) {
		this.collectionName = collectionName;
	}
	
	public int getCollectionId() {
		return collectionId;
	}

	public void setCollectionId(int collectionId) {
		this.collectionId = collectionId;
	}

	/**action
	 * 向服务器上传文件
	 * @return
	 * @throws Exception
	 */
	public String uploadFile() throws Exception {
		String path = ServletActionContext.getServletContext().getRealPath("\\data");
		HttpSession session = ServletActionContext.getRequest().getSession();
		String user_name = (String) session.getAttribute("user");
		int user_id =  (Integer) session.getAttribute("id");
		path += "\\" + user_name + "\\" + collectionName;
		System.out.println(path);
		
		InputStream is = new FileInputStream(file);
        
        OutputStream os = new FileOutputStream(new File(path, fileFileName));
        
        System.out.println("fileFileName: " + fileFileName);
        
        byte[] buffer = new byte[500];
        int length = 0;
        
        while(-1 != (length = is.read(buffer, 0, buffer.length)))
        {
            os.write(buffer);
        }
        
        os.close();
        is.close();
		
		System.out.println(collectionId);
		System.out.println(collectionName);
		
		flag = "";
		url = "data://" + user_name + "/" + collectionName + "/" + fileFileName;
		String sql = "select * from file where filename=? and collectionid=?";
		String[] pa2 = {fileFileName, String.valueOf(collectionId)};
		ResultSet rs = DatabaseTool.query(sql, pa2);
		if(rs != null)
		{
			if(rs.next())//存在相同的文件名
			{
				flag = "false";
			}
			else
			{
				flag = "true";
				sql = "insert into file (filename, collectionid, url) values(?, ?, ?)";
				String[] pa3 = {fileFileName, String.valueOf(collectionId), url};
				DatabaseTool.update(sql, pa3);
			}
		}
		
		JSONObject j_ob = new JSONObject();
		j_ob.put("flag", flag);
		j_ob.put("url", url);
		j_ob.put("collectionName", collectionName);
		j_ob.put("collectionId", collectionId);
	/*	PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.print(new String(j_ob.toString().getBytes("UTF-8"), "iso8859_1"));
		out.flush();
		out.close();*/
		
		return "success";
	}
	
	/**action
	 * 删除用户提交的文件,前台传入fileFileName,collectionId
	 * @throws Exception
	 */
	public void deleteFile() throws Exception {
		System.out.println(collectionId);
		System.out.println(fileFileName);
		String sql = "select * from file where filename=? and collectionid=?";
		String[] pa2 = {fileFileName, String.valueOf(collectionId)};
		ResultSet rs = DatabaseTool.query(sql, pa2);
		String url = null;
		if(rs != null)
		{
			rs.next();
			url = rs.getString("url");
		}
		url = url.replaceFirst("data://", "");
		String path = ServletActionContext.getServletContext().getRealPath("/data/" + url);
		File de_file = new File(path);
		if(de_file.exists())
		{
			de_file.delete();
		}
		sql = "delete from file where (filename=? and collectionid=?)";
		DatabaseTool.update(sql, pa2);
	}
	
	/**action
	 * 添加文件集合
	 * @throws Exception 
	 */
	public void addCollection() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		String user_name = (String) session.getAttribute("user");
		int user_id = (Integer) session.getAttribute("id");
		String result = "";
		if(user_name != null && !"".equals(user_name))
		{
			String path = ServletActionContext.getServletContext().getRealPath("/data");
			String user_namePath = path + "/" + user_name;
			File file = new File(user_namePath);
			if(!file.exists() && !file.isDirectory())
			{
				file.mkdir();
			}
			String collectionPath = user_namePath + "/" + collectionName;
			file = new File(collectionPath);
			if(!file.exists() && !file.isDirectory())
			{
				file.mkdir();
				result = "success";
				String sql = "insert into collection (name, userid) values(?, ?)";
				String[] pa2 = {collectionName, String.valueOf(user_id)};
				PreparedStatement ps = DatabaseTool._insert(sql);
				DatabaseTool.setParameters(ps, pa2);
				ps.executeUpdate();
				ResultSet rs = ps.getGeneratedKeys();
				if(rs != null)
				{
					rs.next();
					collectionId = rs.getInt(1);
				}
			}
			else
			{
				result = "error";
			}
		}
		
		JSONObject j_ob = new JSONObject();
		j_ob.put("flag", result);
		j_ob.put("collectionName", collectionName);
		j_ob.put("collectionId", collectionId);
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.print(new String(j_ob.toString().getBytes("UTF-8"), "iso8859_1"));
		out.flush();
		out.close();
	}
	
	/**action
	 * DataAPI请求文件
	 * @throws IOException
	 */
	public void responseFile() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		InputStream inputStream = request.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
		String param = "";
		String line = null;
		while((line = br.readLine()) != null)
		{
			param += line;
		}
		param = URLDecoder.decode(param, "UTF-8");
		System.out.println("param " + param);
		inputStream.close();
		br.close();
		
		String path = ServletActionContext.getServletContext().getRealPath("/data");
		String filePath = path + "/" + param;
		File file = new File(filePath);
		inputStream = new FileInputStream(file);
		br = new BufferedReader(new InputStreamReader(inputStream));
		String result = "";
		while((line = br.readLine()) != null)
		{
			result += line;
		}
		
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		result = URLEncoder.encode(result, "UTF-8");
		out.print(result);
		out.flush();
		out.close();
		
	}
	
	/**action
	 * DataAPI写入文件
	 * @throws Exception
	 */
	public void requestFile() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		InputStream inputStream = request.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
		String param = "";
		String line = null;
		String result = "";
		while((line = br.readLine()) != null)
		{
			param += line;
		}
		param = URLDecoder.decode(param, "UTF-8");
		inputStream.close();
		br.close();
		
		String path = ServletActionContext.getServletContext().getRealPath("/data");
		String headerPath = request.getHeader("filePath");
		headerPath = URLDecoder.decode(headerPath, "UTF-8");
		String[] headerPathArr = headerPath.split("/");
		String user_namePath = path + "/" + headerPathArr[0];
		File file = new File(user_namePath);
		if(!file.exists() && !file.isDirectory())
		{
			file.mkdir();
		}
		String dirPath = user_namePath + "/" + headerPathArr[1];
		file = new File(dirPath);
		if(!file.exists() && !file.isDirectory())
		{
			file.mkdir();
		}
		String filePath = dirPath + "/" + headerPathArr[2];
		file = new File(filePath);
		if(!file.exists())
		{
			file.createNewFile();
		}
		FileWriter write = new FileWriter(filePath);
		write.write(param);
		write.flush();
		write.close();
		
		String sql = "select * from users where user_name=?";
		String[] parameters = {headerPathArr[0]};
		int user_id = 0;
		ResultSet rs = DatabaseTool.query(sql, parameters);
		if(rs != null)
		{
			if(rs.next())//如果rs.next()为空则表示用户名输入错误
			{
				user_id = rs.getInt("user_id");
				sql = "select * from collection where userid=? and name=?";
				String[] pa = {String.valueOf(user_id), headerPathArr[1]};
				rs = null;
				rs = DatabaseTool.query(sql, pa);
				if(rs != null)
				{
					if(!rs.next())//rs.next()为空表示不存在数据集合
					{
						sql = "insert into collection (userid, name) values(?, ?)";
						PreparedStatement ps = DatabaseTool._insert(sql);
						DatabaseTool.setParameters(ps, pa);
						ps.executeUpdate();
						int collectionid = 0;
						rs = null;
						rs = ps.getGeneratedKeys();
						if(rs != null)
						{
							rs.next();
							collectionid = rs.getInt(1);
						}
						sql = "select * from file where collectionid=? and filename=?";
						pa[0] = String.valueOf(collectionid);
						pa[1] = headerPathArr[2];
						rs = null;
						rs = DatabaseTool.query(sql, pa);
						if(rs != null)
						{
							if(!rs.next())//不存在rs.next()则需要添加
							{
								sql = "insert into file (filename, collectionid, url) values(?, ?, ?)";
								String url = "data://" + headerPath;
								String[] pa3 = {headerPathArr[2], String.valueOf(collectionid), url};
								DatabaseTool.update(sql, pa3);
							}
						}
					}
					else
					{
						int collectionid = rs.getInt("id");
						sql = "select * from file where collectionid=? and filename=?";
						pa[0] = String.valueOf(collectionid);
						pa[1] = headerPathArr[2];
						rs = null;
						rs = DatabaseTool.query(sql, pa);
						if(rs != null)
						{
							if(!rs.next())//不存在rs.next()则需要添加
							{
								sql = "insert into file (filename, collectionid, url) values(?, ?, ?)";
								String url = "data://" + headerPath;
								String[] pa3 = {headerPathArr[2], String.valueOf(collectionid), url};
								DatabaseTool.update(sql, pa3);
							}
						}
					}
				}
				
			}
			else//用户名输入错误
			{
				result = "路径输入错误...";
			}
		}
		
		result = URLEncoder.encode(result, "UTF-8");
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.print(result);
		out.flush();
		out.close();
	}
	
	/**action
	 * 加载当前用户collection集合
	 * @throws Exception
	 */
	public void showCollection() throws Exception {
		List<Collection> collections = getCollection();
		JSONArray j_arr = new JSONArray();
		for(Collection collection : collections)
		{
			JSONObject j_ob = new JSONObject();
			j_ob.put("collectionName", collection.getName());
			j_ob.put("collectionid", collection.getId());
			j_arr.add(j_ob);
		}
		String j_str = j_arr.toString();
		j_str = new String(j_str.getBytes("UTF-8"), "iso8859_1");
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.print(j_str);
		out.flush();
		out.close();
	}
	
	/**action
	 * 加载用户当前选中集合的文件列表
	 * @throws Exception
	 */
	public void showFileList() throws Exception {
		int user_id = (Integer) ServletActionContext.getRequest().getSession().getAttribute("id");
		String sql = "select * from collection where userid=? and name=?";
		String[] pa2 = {String.valueOf(user_id), collectionName};
		ResultSet rs = DatabaseTool.query(sql, pa2);
		int collectionid = 0;
		if(rs != null)
		{
			rs.next();
			collectionid = rs.getInt("id");
		}
		List<MyFile> list = getFileList(collectionid);
		JSONArray j_arr = new JSONArray();
		for(MyFile myFile : list)
		{
			JSONObject j_ob = new JSONObject();
			j_ob.put("collectionid", myFile.getCollectionid());
			j_ob.put("filename", myFile.getFilename());
			j_ob.put("url", myFile.getUrl());
			j_arr.add(j_ob);
		}
		String j_str = j_arr.toString();
		j_str = new String(j_str.getBytes("UTF-8"), "iso8859_1");
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.print(j_str);
		out.flush();
		out.close();
	}
	
	/**
	 * 删除用户当前选择集合，前台传入collectionId,collectionName
	 * @throws Exception
	 */
	public void deleteCollection() throws Exception {
		System.out.println(collectionName);
		System.out.println(collectionId);
		String sql = "delete from file where collectionid=?";
		String[] pa1 = {String.valueOf(collectionId)};
		DatabaseTool.update(sql, pa1);
		
		sql = "delete from collection where id=?";
		DatabaseTool.update(sql, pa1);
		
		String user_name = (String) ServletActionContext.getRequest().getSession().getAttribute("user");
		String path = ServletActionContext.getServletContext().getRealPath("/data/" + user_name + "/" + collectionName);
		File deleteFile = new File(path);
		if(deleteFile.exists())
		{
			deleteDir(deleteFile);
		}
		
	}
	
	/**
	 * 递归删除该文件夹下所有文件
	 * @param dir
	 * @return
	 */
	public boolean deleteDir(File dir) {
		if(dir.isDirectory())
		{
			String[] children = dir.list();
			for(String s : children)
			{
				boolean success = deleteDir(new File(dir, s));
				if(!success)
					return false;
			}
		}
		return dir.delete(); 
	}
	
	/**
	 * 根据session中的id获取collection名称（list）
	 * @return
	 * @throws Exception
	 */
	public List<Collection> getCollection() throws Exception {
		List<Collection> list = new ArrayList<Collection>();
		
		int user_id = (Integer) ServletActionContext.getRequest().getSession().getAttribute("id");
		String sql = "select * from collection where userid=? order by name asc";
		String[] p1 = {String.valueOf(user_id)};
		ResultSet rs = DatabaseTool.query(sql, p1);
		if(rs != null)
		{
			while(rs.next())
			{
				Collection collection = new Collection();
				collection.setId(rs.getInt("id"));
				collection.setName(rs.getString("name"));
				collection.setUserid(rs.getInt("userid"));
				list.add(collection);
			}
		}
		
		return list;
	}
	
	/**
	 * 根据collectionid返回对应集合的文件列表
	 * @param collectionid
	 * @return
	 * @throws Exception
	 */
	public List<MyFile> getFileList(int collectionid) throws Exception {
		List<MyFile> list = new ArrayList<MyFile>();
		
		String sql = "select * from file where collectionid=? order by filename asc";
		String[] pa1 = {String.valueOf(collectionid)};
		ResultSet rs = DatabaseTool.query(sql, pa1);
		if(rs != null)
		{
			while(rs.next())
			{
				MyFile myFile = new MyFile();
				myFile.setCollectionid(collectionid);
				myFile.setFilename(rs.getString("filename"));
				myFile.setUrl(rs.getString("url"));
				list.add(myFile);
			}
		}
		
		return list;
	}
	
	
}
