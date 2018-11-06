package nbs.omp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import nbs.omp.util.Consts;
import nbs.omp.util.Page;
import nbs.omp.model.User;
import nbs.omp.model.TbUser;
import nbs.omp.service.TbUserServiceI;
 
/**
 * 
 * <br>
 * <b>功能：</b>TbUserController<br>
 * <b>作者：</b>David<br>
 * <b>日期：</b><br>
 * <b>版权所有：<b><br>
 */ 

@Controller
@Api(value="",description="")
@RequestMapping("/tbUser") 
public class TbUserController{
	
	private static final Logger logger = Logger.getLogger(TbUserController.class);
	
	@Autowired(required=false) //自动注入，不需要生成set方法了，required=false表示没有实现类，也不会报错。
	private TbUserServiceI tbUserServiceI; 
	
	@RequestMapping(value="insertTbUser",method=RequestMethod.POST)
    //方法上使用@ApiOperation
    @ApiOperation(value="",notes="")
    //参数使用@ApiParam
	public @ResponseBody Object insertTbUser(
	@ApiParam(name="",value="json格式",required=true) @RequestBody(required = true) TbUser tbUser,
			final HttpServletRequest request,
			final HttpServletResponse response) {
		logger.info("begin TbUserController.insertTbUser()");
		JSONObject result = new JSONObject();
		int statusCode = Consts.STATUS_SUCCESS;
		try {
			User user=(User)request.getSession().getAttribute("user");
			int state=0;

		    state=tbUserServiceI.insertTbUser(tbUser);
		    if(state<=0){
		    	statusCode=Consts.STATUS_ERROR;
		    }
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString(),e);
			statusCode=Consts.STATUS_ERROR;
		}
		logger.info("end TbUserController.insertTbUser()");		
		result.put("statusCode", statusCode);
		return result;		
	}
	
	@RequestMapping(value="updateTbUser",method=RequestMethod.POST)
    //方法上使用@ApiOperation
    @ApiOperation(value="",notes="")
    //参数使用@ApiParam
	public @ResponseBody Object updateTbUser(
	@ApiParam(name="",value="json格式",required=true) @RequestBody(required = true) TbUser tbUser,
			final HttpServletRequest request,
			final HttpServletResponse response) {
		logger.info("begin TbUserController.updateTbUser()");
		JSONObject result = new JSONObject();
		int statusCode = Consts.STATUS_SUCCESS;
		try {
			User user=(User)request.getSession().getAttribute("user");
			int state=0;

		    state=tbUserServiceI.updateTbUser(tbUser);
		    if(state<=0){
		    	statusCode=Consts.STATUS_ERROR;
		    }
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString(),e);
			statusCode=Consts.STATUS_ERROR;
		}
		logger.info("end TbUserController.updateTbUser()");		
		result.put("statusCode", statusCode);
		return result;		
	}
	
	@RequestMapping(value="deleteTbUser",method=RequestMethod.POST)
    //方法上使用@ApiOperation
    @ApiOperation(value="",notes="")
    //参数使用@ApiParam
	public @ResponseBody Object deleteTbUser(
	@ApiParam(name="",value="json格式",required=true) @RequestBody(required = true) TbUser tbUser,
			final HttpServletRequest request,
			final HttpServletResponse response) {
		logger.info("begin TbUserController.deleteTbUser()");
		JSONObject result = new JSONObject();
		int statusCode = Consts.STATUS_SUCCESS;
		try {
			User user=(User)request.getSession().getAttribute("user");
			int state=0;
		    state=tbUserServiceI.deleteTbUser(tbUser);
		    if(state<=0){
		    	statusCode=Consts.STATUS_ERROR;
		    }
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString(),e);
			statusCode=Consts.STATUS_ERROR;
		}
		logger.info("end TbUserController.deleteTbUser()");		
		result.put("statusCode", statusCode);
		return result;		
	}
	
	@RequestMapping("/selectTbUserList")
	public @ResponseBody Object selectTbUserList(@RequestParam(required = true)String tbUserStr,
			@RequestParam(required = true)String pageStr,
			final HttpServletRequest request,
			final HttpServletResponse response) {
		logger.info("begin TbUserController.selectTbUserList()");
		JSONObject result = new JSONObject();
		int statusCode = Consts.STATUS_SUCCESS;
		List<TbUser> tbUserList = null;
		Page page=null;
		try {
			if(pageStr!=null && pageStr.length()>0){
				page=JSONObject.parseObject(pageStr, Page.class);
				page.setNeedPage(true);	
			}	
			else{
				page=new Page();
				page.setNeedPage(false);
			}
			if(tbUserStr!=null && tbUserStr.length()>0){
				User user=(User)request.getSession().getAttribute("user");
			    TbUser tbUser=JSONObject.parseObject(tbUserStr, TbUser.class);
				page.getPd().put("tbUser", tbUser);
			    tbUserList = tbUserServiceI.selectTbUserList(page);
			    if(tbUserList != null && tbUserList.size() > 0){
					result.put("tbUserList", tbUserList);
				}
				else
					statusCode=Consts.STATUS_EMPTY;
		     }	
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString(),e);
			statusCode=Consts.STATUS_ERROR;
		}
		logger.info("end TbUserController.selectTbUserList()");		
		result.put("statusCode", statusCode);
		result.put("page", page);
		return result;		
	}
	
	@RequestMapping("/selectTbUser")
	public @ResponseBody Object selectTbUser(@RequestParam(required = true)String tbUserStr,
			final HttpServletRequest request,
			final HttpServletResponse response) {
		logger.info("begin TbUserController.selectTbUser()");
		JSONObject result = new JSONObject();
		int statusCode = Consts.STATUS_SUCCESS;
		TbUser tbUser = null;
		try {
			if(tbUserStr!=null && tbUserStr.length()>0){
				User user=(User)request.getSession().getAttribute("user");
				TbUser tbUserTemp=JSONObject.parseObject(tbUserStr, TbUser.class);
			    tbUser = tbUserServiceI.selectTbUser(tbUserTemp);
		     	result.put("tbUser", tbUser);
		     }			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString(),e);
			statusCode=Consts.STATUS_ERROR;
		}
		logger.info("end TbUserController.selectTbUser()");		
		result.put("statusCode", statusCode);
		return result;		
	}

}
