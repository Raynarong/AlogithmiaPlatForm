package context.inf;

// JspEx Interface 鏆傛椂鐢↗AVA绫绘浛浠�
// TODO 涓嬩竴鏈熸敼涓篨ML鎴朖SON閰嶇疆鏂囦欢褰㈠紡
public interface JspEx {

	// ---------------------------------------------base

	// head , meta
	public static final String j_head = "Jsp/base/in-head.jsp";
	public static final String j_loginHead = "Jsp/base/include-loginHead.jsp";

	// body tail
	public static final String j_left = "Jsp/base/in-left.jsp";
	// body tail
	public static final String j_tail = "Jsp/base/in-tail.jsp";

	// header
	public static final String j_header = "Jsp/base/include-header.jsp";

	// footer
	public static final String j_footer = "Jsp/base/include-footer.jsp";

	// home
	public static final String j_home = "Jsp/base/include-home.jsp";

	// ---------------------------------------------supe

	

	// ---------------------------------------------work

	// work default after login
	public static final String j_work_default = "Jsp/work/include-work-default.jsp";
	

	public static final String j_work_main = "Jsp/work/include-work-main.jsp";
	
	
/*	public static final String tail = "Jsp/base/include-tail-li.jsp";
	public static final String head = "Jsp/base/include-head-li.jsp";*/
}