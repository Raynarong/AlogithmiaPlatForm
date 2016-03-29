package alg.base.action;

import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import alg.base.util.ConfigurationConstant;
import alg.base.util.DatabaseTool;

import com.opensymphony.xwork2.ActionSupport;
import com.web.test.TestClient;

public class EditAlgoAction extends ActionSupport {

	private int id;
	private String editKey;
	private String editValue;
	private String tagName;
	private int tagId;
	
	private String type;
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getTagId() {
		return tagId;
	}

	public void setTagId(int tagId) {
		this.tagId = tagId;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEditKey() {
		return editKey;
	}

	public void setEditKey(String editKey) {
		this.editKey = editKey;
	}

	public String getEditValue() {
		return editValue;
	}

	public void setEditValue(String editValue) {
		this.editValue = editValue;
	}

	public void editAlgo() throws Throwable {
		Map<String, String> map = new HashMap<String, String>();
		map.put("description", "algorithm_describe");
		map.put("inputDescription", "input_instruction");
		map.put("inputInstance", "input_instance");
		map.put("isopensource", "algorithm_open");

		Map<String, Integer> keyMap = new HashMap<String, Integer>();
		keyMap.put("description", 1);
		keyMap.put("inputDescription", 2);
		keyMap.put("inputInstance", 3);
		keyMap.put("isopensource", 4);
		
		String result = "";
		String sql = "update algorithm_table set " + map.get(editKey) + "=? where algorithm_id=?";
		String[] parameters = {editValue, String.valueOf(id)};
		int rs = 0;
		int key = keyMap.get(editKey);
		switch (key) {
		case 1:
			rs = DatabaseTool.update(sql, parameters);
			if(rs != 0)
			{
				result = "算法描述更新成功";
			}
			break;
		case 2:
			rs = DatabaseTool.update(sql, parameters);
			if(rs != 0)
			{
				result = "输入说明更新成功";
			}
			break;
		case 3:
			rs = DatabaseTool.update(sql, parameters);
			if(rs != 0)
			{
				sql = "select * from algorithm_table where algorithm_id=?";
				String[] param = {String.valueOf(id)};
				ResultSet res = DatabaseTool.query(sql, param);
				int user_id = 0;
				String algorithm_name = "";
				if(res != null)
				{
					res.next();
					user_id = res.getInt("user_id");
					algorithm_name = res.getString("algorithm_name");
				}
				sql = "select * from users where user_id=?";
				param[0] = String.valueOf(user_id);
				res = null;
				res = DatabaseTool.query(sql, param);
				String user_name = "";
				if(res != null)
				{
					res.next();
					user_name = res.getString("user_name");
				}
				String classStr = user_name + "." + algorithm_name + "." + algorithm_name;
				TestClient testClient = new TestClient(ConfigurationConstant.ALOGSERVER_URL + "/servlet/HelloworldServlet", classStr, editValue, user_name, "作者更新详情", "Web服务器");
				result = testClient.callTest();
				sql = "update algorithm_table set output_instance=? where algorithm_id=?";
				parameters[0] = result;
				parameters[1] = String.valueOf(id);
				DatabaseTool.update(sql, parameters);
			}
			break;
		case 4:
			rs = DatabaseTool.update(sql, parameters);
			if(rs != 0)
			{
				result = "算法开源状态更新成功";
			}
			break;
		}
		
		result = new String(result.getBytes("UTF-8"), "iso8859_1");
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.print(result);
		out.flush();
		out.close();
	}

	/**
	 * 根据算法id删除算法（不确定是否会清楚该算法的外键）
	 * @throws Exception
	 */
	public String deleteAlgo() throws Exception {
		String sql = "delete from algorithm_table where (algorithm_id=?)";
		String[] parameters = {String.valueOf(id)};
		String result = "";
	int rs = DatabaseTool.update(sql, parameters);
		if(rs != 0)
		{
			result = "success";
		}
		
		return result;
	}
	
	/**
	 * 查询tag序列
	 * @throws Exception
	 */
	public void showTag() throws Exception {
		String sql = "select tag_id, count( * ) as count from algo_tag group by tag_id order by count desc";
		String[] parameters = {};
		ResultSet rs = DatabaseTool.query(sql, parameters);
		List<Integer> tagOrderList = new ArrayList<Integer>();
		if(rs != null)
		{
			while(rs.next())
			{
				tagOrderList.add(rs.getInt("tag_id"));
			}
		}
		
		rs = null;
		sql = "select * from algorithm_tags";
		rs = DatabaseTool.query(sql, parameters);
		Map<Integer, String> tagMap = new HashMap<Integer, String>();
		if(rs != null)
		{
			while(rs.next())
			{
				tagMap.put(rs.getInt("tag_id"), rs.getString("tag_name"));
			}
		}
		
		JSONArray j_arr = new JSONArray();
		for(int s : tagOrderList)
		{
			JSONObject j_ob = new JSONObject();
			j_ob.put("id", s);
			j_ob.put("tagName", tagMap.get(s));
			System.out.println(j_ob);
			j_arr.add(j_ob);
		}
		System.out.println(j_arr);
		
		//返回数据可能需要转码
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		String j_arrStr = j_arr.toString();
		j_arrStr = new String(j_arrStr.getBytes("UTF-8"), "iso8859_1");
		out.print(j_arrStr);
		out.flush();
		out.close();
	}
	
	/**
	 * 添加tag标签，添加tag与算法id的链接，若algorithm_tags表中未出现，则需添加到algorithm_tags表
	 * @throws Exception
	 */
	public void addTag() throws Exception {
		
		String sql = "select * from algorithm_tags where tag_name=?";
		String[] params = {tagName};
		ResultSet res = DatabaseTool.query(sql, params);
		if(res != null)
		{
			if(res.next())//表示该tag已经存在，只需修改关系表
			{
				tagId = res.getInt("tag_id");
				sql = "select * from algo_tag where (tag_id=? and algorithm_id=?)";
				String[] pp = {String.valueOf(tagId), String.valueOf(id)};
				ResultSet rr = DatabaseTool.query(sql, pp);
				if(rr != null)
				{
					if(rr.next())
					{
						
						String result = "error";
						PrintWriter out = ServletActionContext.getResponse().getWriter();
						out.print(result);
						out.flush();
						out.close();
					}
					else
					{
						sql = "insert into algo_tag (algorithm_id, tag_id) values (?, ?)";
						String[] param = {String.valueOf(id), String.valueOf(tagId)};
						int r = DatabaseTool.update(sql, param);
						String result = "";
						if(r != 0)
						{
							result = "success";
						}
						PrintWriter out = ServletActionContext.getResponse().getWriter();
						out.print(result);
						out.flush();
						out.close();
					}
				}
			}
			else//表示algorithm_tags表中没有该tag需要添加algorithm_tags表
			{
				sql = "insert into algorithm_tags (tag_name) values (?)";
				String[] parameters = {tagName};
				PreparedStatement ps = DatabaseTool._insert(sql);
				DatabaseTool.setParameters(ps, parameters);
				ps.executeUpdate();
				ResultSet rs = ps.getGeneratedKeys();
				if(rs != null)
				{
					rs.next();
					tagId = rs.getInt(1);
				}
				
				sql = "insert into algo_tag (algorithm_id, tag_id) values (?, ?)";
				String[] param = {String.valueOf(id), String.valueOf(tagId)};
				int r = DatabaseTool.update(sql, param);
				String result = "";
				if(r != 0)
				{
					result = "success";
				}
				PrintWriter out = ServletActionContext.getResponse().getWriter();
				out.print(result);
				out.flush();
				out.close();
			}
		}
	}
	
	/**
	 * 根据算法id和tagId删除关联表中的关联数据
	 * @throws Exception
	 */
	public void deleteTag() throws Exception {
		String sql = "select * from algorithm_tags where tag_name=?";
		String[] param = {tagName};
		ResultSet res = DatabaseTool.query(sql, param);
		if(res != null)
		{
			res.next();
			tagId = res.getInt("tag_id");
		}
		sql = "delete from algo_tag where (algorithm_id=? and tag_id=?)";
		String[] parameters = {String.valueOf(id), String.valueOf(tagId)};
		int rs = DatabaseTool.update(sql, parameters);
		String result = "";
		if(rs != 0)
		{
			result = "success";
		}
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.print(result);
		out.flush();
		out.close();
	}
	
	public void limitsControl() throws Exception {
		String sql = "select * from algorithm_table where algorithm_id=?";
		String[] parameters = {String.valueOf(id)};
		ResultSet rs = DatabaseTool.query(sql, parameters);
		
		int user_id = 0;
		int type_id = 0;
		if(rs != null)
		{
			while(rs.next())
			{
				user_id = rs.getInt("user_id");
				type_id = rs.getInt("type_id");
			}
		}
		HttpSession session = ServletActionContext.getRequest().getSession();
		int login_id = 0;
		String id_str = String.valueOf(session.getAttribute("id"));
		if(id_str != null && !id_str.equals("null"))
		{
			login_id = (Integer) session.getAttribute("id");
		}
		else
		{
			login_id = -1;
		}
		
		sql = "select * from algorithm_type";
		String[] pa = {};
		rs = DatabaseTool.query(sql, pa);
		Map<Integer, String> type_map = new HashMap<Integer, String>();
		if(rs != null)
		{
			while(rs.next())
			{
				type_map.put(rs.getInt("type_id"), rs.getString("type_name"));
			}
		}
		
		String type_name = type_map.get(type_id);
		System.out.println(type_name);
		JSONArray j_arr = new JSONArray();
		JSONObject j_ob = new JSONObject();
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		if(user_id == login_id)
		{
			j_ob.put("flag", "true");
		}
		else
		{
			j_ob.put("flag", "false");
		}
		j_ob.put("type_name", type_name);
//		j_arr.add(j_ob);
//		j_arr.add(type_map);
//		String j_arrStr = j_arr.toString();
		j_ob.put("type_map", type_map);
		String j_obStr = j_ob.toString();
		j_obStr = new String(j_obStr.getBytes("UTF-8"), "iso8859_1");
		out.print(j_obStr);
		out.flush();
		out.close();
	}
	
	public void setSelect() throws Exception {
		System.out.println(type);
		String sql = "select * from algorithm_type where type_name=?";
		String[] pa1 = {type};
		ResultSet rs = DatabaseTool.query(sql, pa1);
		int type_id = 0;
		if(rs != null)
		{
			rs.next();
			type_id = rs.getInt("type_id");
		}
		
		sql = "update algorithm_table set type_id=? where algorithm_id=?";
		String[] pa2 = {String.valueOf(type_id), String.valueOf(id)};
		int r = DatabaseTool.update(sql, pa2);
		String result = "";
		if(r != 0)
			result = "success";
		else
			result = "error";
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.print(result);
		out.flush();
		out.close();
	}
	
	public static void main(String[] args) throws Exception {
		EditAlgoAction e = new EditAlgoAction();
		e.showTag();
	}
	
	
	
}
