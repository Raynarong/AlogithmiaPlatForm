package alg.base.util;

public class CallRecord {
	
	public boolean record(Integer algo_id, Integer caller_id,String call_time,String input) throws Exception{
		String sql = "insert into algo_call (algo_id, caller_id, call_time, input) values (?,?,?,?);";
		String[] parameters = {algo_id.toString(), caller_id.toString(), call_time, input};
		int result = DatabaseTool.update(sql, parameters);
		if(result == 1){
			return true;
		}else{
			return false;
		}
	}
	
	

}
