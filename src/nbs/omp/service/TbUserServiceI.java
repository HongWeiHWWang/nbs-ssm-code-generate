package nbs.omp.service;

import java.util.List;
import nbs.omp.util.Page;
import nbs.omp.model.TbUser;

/**
 * 
 * <br>
 * <b>功能：</b>TbUserService<br>
 * <b>作者：</b>David<br>
 * <b>日期：</b><br>
 * <b>版权所有：<b><br>
 */
public interface TbUserServiceI {	

	public int insertTbUser(TbUser tbUser) throws Exception;
	
	public int updateTbUser(TbUser tbUser) throws Exception;
	
	public int deleteTbUser(TbUser tbUser) throws Exception;
	
	public TbUser selectTbUser(TbUser tbUser) throws Exception;
	
	public List<TbUser> selectTbUserList(Page page) throws Exception;

}
