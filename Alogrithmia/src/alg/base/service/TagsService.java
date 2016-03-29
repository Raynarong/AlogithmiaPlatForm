package alg.base.service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import alg.base.bean.Algorithm;
import alg.base.bean.AlgorithmTags;
import alg.base.util.DatabaseTool;

public class TagsService {

		public ArrayList<AlgorithmTags> getAllTags() throws Exception{
			String sql = "select * from algorithm_tags";
			String p[] = {};
			ResultSet rs = DatabaseTool.query(sql, p);
			ArrayList<AlgorithmTags> arrTags = new ArrayList<AlgorithmTags>();
			while(rs.next()){
				AlgorithmTags algTags = new AlgorithmTags();
				algTags.setTag_id(rs.getInt("tag_id"));
//				algTags.setAlgorithim_id(rs.getInt("algorithm_id"));
				algTags.setTag_name(rs.getString("tag_name"));
				arrTags.add(algTags);
			}
			return arrTags;
		}
		public ArrayList<AlgorithmTags> getTagsName() throws Exception{
			String sql = "select distinct tag_name ,tag_id from algorithm_tags";
			String p[] = {};
			ResultSet rs = DatabaseTool.query(sql, p);
			ArrayList<AlgorithmTags> tagsName = new ArrayList<AlgorithmTags>();
			while(rs.next()){
				AlgorithmTags algTagsName = new AlgorithmTags();
				algTagsName.setTag_name(rs.getString("tag_name"));
				algTagsName.setTag_id(rs.getInt("tag_id"));
				tagsName.add(algTagsName);
			}
			return tagsName;
		}
		
		public ArrayList<Algorithm> getArrAlg(String tagName) throws Exception{
			ArrayList<Algorithm> arrAlg = new ArrayList<Algorithm>();
			String sql = "select * from algorithm_tags,algo_tag,algorithm_table,users where algo_tag.tag_id=? and algorithm_tags.tag_id=algo_tag.tag_id and algo_tag.algorithm_id=algorithm_table.algorithm_id and algorithm_table.user_id=users.user_id;";
			String p[] = {tagName};
			ResultSet rs = DatabaseTool.query(sql, p);
			while (rs.next()) {
				Algorithm alg = new Algorithm();
				alg.setAlgorithm_describe(rs.getString("algorithm_describe"));
				alg.setAlgorithm_id(rs.getInt("algorithm_id"));
				alg.setAlgorithm_lang(rs.getString("algorithm_lang"));
				alg.setAlgorithm_name(rs.getString("algorithm_name"));
				alg.setAlgorithm_open(rs.getInt("algorithm_open"));
				alg.setAlgorithm_pay(rs.getInt("algorithm_pay"));
				alg.setAlgorithm_root(rs.getString("algorithm_root"));
				alg.setInput_instance(rs.getString("input_instance"));
				alg.setInput_instruction(rs.getString("input_instance"));
				alg.setInput_type(rs.getString("input_type"));
				alg.setOutput_instance(rs.getString("output_instance"));
				alg.setOutput_type(rs.getString("output_type"));
				alg.setSerial_number(rs.getString("serial_number"));
				alg.setVersion(rs.getString("version"));
				alg.setVist_times(rs.getInt("vist_times"));
				alg.setUser_id(rs.getInt("user_id"));
				alg.setUser_name(rs.getString("user_name"));
				arrAlg.add(alg);
				
			}
			return arrAlg;
		}
		public ArrayList<AlgorithmTags> getMatchTag(String match) throws Exception{
			String sql = "select distinct tag_name,tag_id from algorithm_tags where tag_name like ?";
			String p[] = {"%"+match+"%"};
			ResultSet rs = DatabaseTool.query(sql, p);
			ArrayList<AlgorithmTags> tagsName = new ArrayList<AlgorithmTags>();
			while(rs.next()){
				AlgorithmTags algTagsName = new AlgorithmTags();
				algTagsName.setTag_name(rs.getString("tag_name"));
				algTagsName.setTag_id(rs.getInt("tag_id"));
				tagsName.add(algTagsName);
			}
			for (AlgorithmTags t: tagsName) {
				System.out.println(t.getTag_name());
			}
			return tagsName;
		}
}
