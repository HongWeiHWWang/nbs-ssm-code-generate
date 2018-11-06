package ${bussPackage}.controller;

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
import ${bussPackage}.model.${className};
import ${bussPackage}.service.${className}ServiceI;
 
/**
 * 
 * <br>
 * <b>功能：</b>${className}Controller<br>
 * <b>作者：</b>David<br>
 * <b>日期：</b><br>
 * <b>版权所有：<b><br>
 */ 

@Controller
@Api(value="",description="")
@RequestMapping("/${lowerName}") 
public class ${className}Controller{
	
	private static final Logger logger = Logger.getLogger(${className}Controller.class);
	
	@Autowired(required=false) //自动注入，不需要生成set方法了，required=false表示没有实现类，也不会报错。
	private ${className}ServiceI ${lowerName}ServiceI; 
	
	@RequestMapping(value="insert${className}",method=RequestMethod.POST)
    //方法上使用@ApiOperation
    @ApiOperation(value="",notes="")
    //参数使用@ApiParam
	public @ResponseBody Object insert${className}(
	@ApiParam(name="",value="json格式",required=true) @RequestBody(required = true) ${className} ${lowerName},
			final HttpServletRequest request,
			final HttpServletResponse response) {
		logger.info("begin ${className}Controller.insert${className}()");
		JSONObject result = new JSONObject();
		int statusCode = Consts.STATUS_SUCCESS;
		try {
			User user=(User)request.getSession().getAttribute("user");
			int state=0;

		    state=${lowerName}ServiceI.insert${className}(${lowerName});
		    if(state<=0){
		    	statusCode=Consts.STATUS_ERROR;
		    }
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString(),e);
			statusCode=Consts.STATUS_ERROR;
		}
		logger.info("end ${className}Controller.insert${className}()");		
		result.put("statusCode", statusCode);
		return result;		
	}
	
	@RequestMapping(value="update${className}",method=RequestMethod.POST)
    //方法上使用@ApiOperation
    @ApiOperation(value="",notes="")
    //参数使用@ApiParam
	public @ResponseBody Object update${className}(
	@ApiParam(name="",value="json格式",required=true) @RequestBody(required = true) ${className} ${lowerName},
			final HttpServletRequest request,
			final HttpServletResponse response) {
		logger.info("begin ${className}Controller.update${className}()");
		JSONObject result = new JSONObject();
		int statusCode = Consts.STATUS_SUCCESS;
		try {
			User user=(User)request.getSession().getAttribute("user");
			int state=0;

		    state=${lowerName}ServiceI.update${className}(${lowerName});
		    if(state<=0){
		    	statusCode=Consts.STATUS_ERROR;
		    }
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString(),e);
			statusCode=Consts.STATUS_ERROR;
		}
		logger.info("end ${className}Controller.update${className}()");		
		result.put("statusCode", statusCode);
		return result;		
	}
	
	@RequestMapping(value="delete${className}",method=RequestMethod.POST)
    //方法上使用@ApiOperation
    @ApiOperation(value="",notes="")
    //参数使用@ApiParam
	public @ResponseBody Object delete${className}(
	@ApiParam(name="",value="json格式",required=true) @RequestBody(required = true) ${className} ${lowerName},
			final HttpServletRequest request,
			final HttpServletResponse response) {
		logger.info("begin ${className}Controller.delete${className}()");
		JSONObject result = new JSONObject();
		int statusCode = Consts.STATUS_SUCCESS;
		try {
			User user=(User)request.getSession().getAttribute("user");
			int state=0;
		    state=${lowerName}ServiceI.delete${className}(${lowerName});
		    if(state<=0){
		    	statusCode=Consts.STATUS_ERROR;
		    }
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString(),e);
			statusCode=Consts.STATUS_ERROR;
		}
		logger.info("end ${className}Controller.delete${className}()");		
		result.put("statusCode", statusCode);
		return result;		
	}
	
	@RequestMapping("/select${className}List")
	public @ResponseBody Object select${className}List(@RequestParam(required = true)String ${lowerName}Str,
			@RequestParam(required = true)String pageStr,
			final HttpServletRequest request,
			final HttpServletResponse response) {
		logger.info("begin ${className}Controller.select${className}List()");
		JSONObject result = new JSONObject();
		int statusCode = Consts.STATUS_SUCCESS;
		List<${className}> ${lowerName}List = null;
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
			if(${lowerName}Str!=null && ${lowerName}Str.length()>0){
				User user=(User)request.getSession().getAttribute("user");
			    ${className} ${lowerName}=JSONObject.parseObject(${lowerName}Str, ${className}.class);
				page.getPd().put("${lowerName}", ${lowerName});
			    ${lowerName}List = ${lowerName}ServiceI.select${className}List(page);
			    if(${lowerName}List != null && ${lowerName}List.size() > 0){
					result.put("${lowerName}List", ${lowerName}List);
				}
				else
					statusCode=Consts.STATUS_EMPTY;
		     }	
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString(),e);
			statusCode=Consts.STATUS_ERROR;
		}
		logger.info("end ${className}Controller.select${className}List()");		
		result.put("statusCode", statusCode);
		result.put("page", page);
		return result;		
	}
	
	@RequestMapping("/select${className}")
	public @ResponseBody Object select${className}(@RequestParam(required = true)String ${lowerName}Str,
			final HttpServletRequest request,
			final HttpServletResponse response) {
		logger.info("begin ${className}Controller.select${className}()");
		JSONObject result = new JSONObject();
		int statusCode = Consts.STATUS_SUCCESS;
		${className} ${lowerName} = null;
		try {
			if(${lowerName}Str!=null && ${lowerName}Str.length()>0){
				User user=(User)request.getSession().getAttribute("user");
				${className} ${lowerName}Temp=JSONObject.parseObject(${lowerName}Str, ${className}.class);
			    ${lowerName} = ${lowerName}ServiceI.select${className}(${lowerName}Temp);
		     	result.put("${lowerName}", ${lowerName});
		     }			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString(),e);
			statusCode=Consts.STATUS_ERROR;
		}
		logger.info("end ${className}Controller.select${className}()");		
		result.put("statusCode", statusCode);
		return result;		
	}

}
