package tw.com.crm.info360.webapp.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 基本導頁設定
 * 
 * @author Billy
 */
@Controller
public class BasicController {

	/**
	 * 預設「歡迎頁面」
	 * 
	 * @param name
	 * @param tel
	 * @param model
	 * 
	 * @return String 透過字串指定轉導頁面
	 */
	@RequestMapping(value = "/")
	public String showIndex() {
		return "console";
	}

	/**
	 * 
	 * @param name
	 * @param tel
	 * @param model
	 * 
	 * @return String 透過字串指定轉導頁面
	 */
	@RequestMapping("/console") // 作用等同<url-pattern>
	public String console() {
		return "console"; // 頁面導向 /WEB-INF/views/ 搜索檔案類型.jsp
	}

	/**
	 * 
	 * @param userName
	 * @param password
	 * @param model
	 * 
	 * @return String 透過字串指定轉導頁面
	 * @throws IOException
	 */
	@RequestMapping("/main") // 作用等同<url-pattern>
	public String main(@RequestParam(value = "userName", required = false) String userName,
			@RequestParam(value = "password", required = false) String password, Model model) throws IOException {
		model.addAttribute("userName", userName);
		model.addAttribute("password", password);

		Properties prop = new Properties();

		String propFileName = "config.properties";

		InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);

		if (inputStream != null) {
			prop.load(inputStream);
		} else {
			throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
		}

		String websocket_hostname = prop.getProperty("websocket.hostname");
		String websocket_protocol = prop.getProperty("websocket.protocol");
		String websocket_port = prop.getProperty("websocket.port");

		String Info360_Setting_protocol = prop.getProperty("Info360_Setting.protocol");
		String Info360_Setting_hostname = prop.getProperty("Info360_Setting.hostname");
		String Info360_Setting_port = prop.getProperty("Info360_Setting.port");

		model.addAttribute("websocket_hostname", websocket_hostname);
		model.addAttribute("websocket_protocol", websocket_protocol);
		model.addAttribute("websocket_port", websocket_port);

		model.addAttribute("Info360_Setting_protocol", Info360_Setting_protocol);
		model.addAttribute("Info360_Setting_hostname", Info360_Setting_hostname);
		model.addAttribute("Info360_Setting_port", Info360_Setting_port);

		return "main_view"; // 頁面導向 /WEB-INF/views/ 搜索檔案類型.jsp
	}

	/*--------- Tab 分頁導頁控制區 ----------*/
	@RequestMapping(value = "dashboard")
	public String showDashBoard(Model model) throws IOException {

		Properties prop = new Properties();

		String propFileName = "config.properties";

		InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);

		if (inputStream != null) {
			prop.load(inputStream);
		} else {
			throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
		}

		String IMWebSocket_protocol = prop.getProperty("IMWebSocket.protocol");
		String IMWebSocket_hostname = prop.getProperty("IMWebSocket.hostname");
		String IMWebSocket_port = prop.getProperty("IMWebSocket.port");

		model.addAttribute("IMWebSocket_protocol", IMWebSocket_protocol);
		model.addAttribute("IMWebSocket_hostname", IMWebSocket_hostname);
		model.addAttribute("IMWebSocket_port", IMWebSocket_port);

		return "info360/dashboard";
	}

	@RequestMapping(value = "query")
	public String showQuery() {
		return "info360/query";
	}

	@RequestMapping(value = "setting")
	public String showSetting(Model model) throws IOException {

		Properties prop = new Properties();

		String propFileName = "config.properties";

		InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);

		if (inputStream != null) {
			prop.load(inputStream);
		} else {
			throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
		}

		String IMWebSocket_protocol = prop.getProperty("IMWebSocket.protocol");
		String IMWebSocket_hostname = prop.getProperty("IMWebSocket.hostname");
		String IMWebSocket_port = prop.getProperty("IMWebSocket.port");

		String Info360_Setting_protocol = prop.getProperty("Info360_Setting.protocol");
		String Info360_Setting_hostname = prop.getProperty("Info360_Setting.hostname");
		String Info360_Setting_port = prop.getProperty("Info360_Setting.port");
		
		model.addAttribute("IMWebSocket_protocol", IMWebSocket_protocol);
		model.addAttribute("IMWebSocket_hostname", IMWebSocket_hostname);
		model.addAttribute("IMWebSocket_port", IMWebSocket_port);

		model.addAttribute("Info360_Setting_protocol", Info360_Setting_protocol);
		model.addAttribute("Info360_Setting_hostname", Info360_Setting_hostname);
		model.addAttribute("Info360_Setting_port", Info360_Setting_port);

		return "info360/setting";
	}

	@RequestMapping(value = "password")
	public String showPassowrd() {
		return "info360/password";
	}

	/*--------- Chat 分頁導頁控制區 ----------*/
	@RequestMapping(value = "chat1")
	public String showChatV1(@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "interactionId", required = false) String interactionId, Model model) throws IOException {
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		model.addAttribute("address", address);
		model.addAttribute("interactionId", interactionId);
		
		Properties prop = new Properties();

		String propFileName = "config.properties";

		InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);

		if (inputStream != null) {
			prop.load(inputStream);
		} else {
			throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
		}

		String IMWebSocket_protocol = prop.getProperty("IMWebSocket.protocol");
		String IMWebSocket_hostname = prop.getProperty("IMWebSocket.hostname");
		String IMWebSocket_port = prop.getProperty("IMWebSocket.port");

		model.addAttribute("IMWebSocket_protocol", IMWebSocket_protocol);
		model.addAttribute("IMWebSocket_hostname", IMWebSocket_hostname);
		model.addAttribute("IMWebSocket_port", IMWebSocket_port);

		return "info360/chat/chat_v1";
	}

	@RequestMapping(value = "chat2")
	public String showChatV2(@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "interactionId", required = false) String interactionId, Model model) throws IOException {
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		model.addAttribute("address", address);
		model.addAttribute("interactionId", interactionId);
		
		Properties prop = new Properties();

		String propFileName = "config.properties";

		InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);

		if (inputStream != null) {
			prop.load(inputStream);
		} else {
			throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
		}

		String IMWebSocket_protocol = prop.getProperty("IMWebSocket.protocol");
		String IMWebSocket_hostname = prop.getProperty("IMWebSocket.hostname");
		String IMWebSocket_port = prop.getProperty("IMWebSocket.port");

		model.addAttribute("IMWebSocket_protocol", IMWebSocket_protocol);
		model.addAttribute("IMWebSocket_hostname", IMWebSocket_hostname);
		model.addAttribute("IMWebSocket_port", IMWebSocket_port);

		return "info360/chat/chat_v2";
	}

	@RequestMapping(value = "chat3")
	public String showChatV3(@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "interactionId", required = false) String interactionId, Model model) throws IOException {
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		model.addAttribute("address", address);
		model.addAttribute("interactionId", interactionId);
		
		Properties prop = new Properties();

		String propFileName = "config.properties";

		InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);

		if (inputStream != null) {
			prop.load(inputStream);
		} else {
			throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
		}

		String IMWebSocket_protocol = prop.getProperty("IMWebSocket.protocol");
		String IMWebSocket_hostname = prop.getProperty("IMWebSocket.hostname");
		String IMWebSocket_port = prop.getProperty("IMWebSocket.port");

		model.addAttribute("IMWebSocket_protocol", IMWebSocket_protocol);
		model.addAttribute("IMWebSocket_hostname", IMWebSocket_hostname);
		model.addAttribute("IMWebSocket_port", IMWebSocket_port);

		return "info360/chat/chat_v3";
	}

	@RequestMapping(value = "chat4")
	public String showChatV4(@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "interactionId", required = false) String interactionId, Model model) throws IOException {
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		model.addAttribute("address", address);
		model.addAttribute("interactionId", interactionId);
		
		Properties prop = new Properties();

		String propFileName = "config.properties";

		InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);

		if (inputStream != null) {
			prop.load(inputStream);
		} else {
			throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
		}

		String IMWebSocket_protocol = prop.getProperty("IMWebSocket.protocol");
		String IMWebSocket_hostname = prop.getProperty("IMWebSocket.hostname");
		String IMWebSocket_port = prop.getProperty("IMWebSocket.port");

		model.addAttribute("IMWebSocket_protocol", IMWebSocket_protocol);
		model.addAttribute("IMWebSocket_hostname", IMWebSocket_hostname);
		model.addAttribute("IMWebSocket_port", IMWebSocket_port);

		return "info360/chat/chat_v4";
	}

	@RequestMapping(value = "chat5")
	public String showChatV5(@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "interactionId", required = false) String interactionId, Model model) throws IOException {
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		model.addAttribute("address", address);
		model.addAttribute("interactionId", interactionId);
		
		Properties prop = new Properties();

		String propFileName = "config.properties";

		InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);

		if (inputStream != null) {
			prop.load(inputStream);
		} else {
			throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
		}

		String IMWebSocket_protocol = prop.getProperty("IMWebSocket.protocol");
		String IMWebSocket_hostname = prop.getProperty("IMWebSocket.hostname");
		String IMWebSocket_port = prop.getProperty("IMWebSocket.port");

		model.addAttribute("IMWebSocket_protocol", IMWebSocket_protocol);
		model.addAttribute("IMWebSocket_hostname", IMWebSocket_hostname);
		model.addAttribute("IMWebSocket_port", IMWebSocket_port);

		return "info360/chat/chat_v5";
	}

}