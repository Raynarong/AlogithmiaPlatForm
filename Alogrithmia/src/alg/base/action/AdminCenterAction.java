package alg.base.action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONObject;

import alg.base.bean.Type;
import alg.base.util.DatabaseTool;
import alg.base.util.FlushTool;

import com.opensymphony.xwork2.ActionSupport;

public class AdminCenterAction extends ActionSupport {
	private int currentIndex = 1;
	private int itemsPerPage = 2;
	private int totalPage=1;
	
	private String type_name;
	private int type_id;
	
	private String about_text;
	
	public String getAbout_text() {
		return about_text;
	}

	public void setAbout_text(String about_text) {
		this.about_text = about_text;
	}

	public int getType_id() {
		return type_id;
	}

	public void setType_id(int type_id) {
		this.type_id = type_id;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentIndex() {
		return currentIndex;
	}

	public void setCurrentIndex(int currentIndex) {
		this.currentIndex = currentIndex;
	}

	public int getItemsPerPage() {
		return itemsPerPage;
	}

	public void setItemsPerPage(int itemsPerPage) {
		this.itemsPerPage = itemsPerPage;
	}

	public void getTypeList() throws Exception {
		List<Type> typeList = new ArrayList<Type>();
		String sql = "select * from algorithm_type";
		String[] pa = {};
		ResultSet rs = DatabaseTool.query(sql, pa);
		if(rs != null) {
			while(rs.next()) {
				Type type = new Type();
				type.setType_id(rs.getInt("type_id"));
				type.setType_name(rs.getString("type_name"));
				typeList.add(type);
			}
		}
		List<Type> currentList = new ArrayList<Type>();
		for(int i = (currentIndex-1) * itemsPerPage; i < typeList.size() && i < currentIndex * itemsPerPage; i++) {
			currentList.add(typeList.get(i));
		}
		totalPage = (int) (Math.ceil((double)typeList.size()/itemsPerPage));
		JSONObject j_ob = new JSONObject();
		j_ob.put("currentList", currentList);
		j_ob.put("currentIndex", currentIndex);
		j_ob.put("totalPage", totalPage);
		String str = j_ob.toString();
		//str = new String(str.getBytes("UTF-8"), "iso8859_1");
		FlushTool.flushJsonRecord(str);
	}
	
	public void addType() throws Exception {
		String sql = "select * from algorithm_type";
		String[] pa = {};
		ResultSet res = DatabaseTool.query(sql, pa);
		List<String> types = new ArrayList<String>();
		if(res != null)
		{
			while(res.next())
			{
				types.add(res.getString("type_name"));
			}
		}
		if(types.contains(type_name))
			return;
		sql = "insert into algorithm_type(type_name) values (?)";
		String[] pa1 = {type_name};
		int rs = DatabaseTool.update(sql, pa1);
		System.out.println(rs);
		if(rs != -1)
		{
			FlushTool.flushJsonRecord("success");
		}
	}
	
	public void deleteType() throws Exception {
		String sql = "delete from algorithm_type where (type_id=?)";
		String[] pa = {String.valueOf(type_id)};
		System.out.println(type_id);
		int rs = DatabaseTool.update(sql, pa);
		if(rs != -1)
		{
			FlushTool.flushJsonRecord("success");
		}
	}
	
	public void modifyType() throws Exception {
		String sql ="update algorithm_type set type_name=? where type_id=?";
		String[] pa2 = {type_name, String.valueOf(type_id)};
		int rs = DatabaseTool.update(sql, pa2);
		if(rs != -1)
		{
			FlushTool.flushJsonRecord("success");
		}
	}
	
	public void aboutUs() throws Exception {
		String path = ServletActionContext.getServletContext().getRealPath("/about_us/about_us.txt");
		File file = new File(path);
		if (!file.exists()) {
			file.createNewFile();
		}
		FileWriter write = new FileWriter(file);
		write.write(about_text);
		write.flush();
		write.close();
	}
	
	public void loadAboutUs() throws Exception {
		String result = "";
		String line = null;
		String path = ServletActionContext.getServletContext().getRealPath("/about_us/about_us.txt");
		File file = new File(path);
		InputStream inputStream = new FileInputStream(file);
		BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
		while((line = br.readLine()) != null)
		{
			result += line;
		}
		FlushTool.flushJsonRecord(result);
	}
}
