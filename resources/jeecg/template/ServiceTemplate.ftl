package ${bussPackage}.service;

import java.util.List;
import nbs.omp.util.Page;
import ${bussPackage}.model.${className};

/**
 * 
 * <br>
 * <b>功能：</b>${className}Service<br>
 * <b>作者：</b>David<br>
 * <b>日期：</b><br>
 * <b>版权所有：<b><br>
 */
public interface ${className}ServiceI {	

	public int insert${className}(${className} ${lowerName}) throws Exception;
	
	public int update${className}(${className} ${lowerName}) throws Exception;
	
	public int delete${className}(${className} ${lowerName}) throws Exception;
	
	public ${className} select${className}(${className} ${lowerName}) throws Exception;
	
	public List<${className}> select${className}List(Page page) throws Exception;

}
