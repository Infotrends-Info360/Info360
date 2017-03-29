package tw.com.crm.info360.webapp.controller;

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

	private static Properties properties;

	/**
	 * 預設「歡迎頁面、登入頁」
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
	 * 預設「歡迎頁面、登入頁」
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
	 * 「主要畫面」
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

		// 取得設定參數
		getProperties();

		String websocket_hostname = properties.getProperty("websocket.hostname");
		String websocket_protocol = properties.getProperty("websocket.protocol");
		String websocket_port = properties.getProperty("websocket.port");

		String Info360_Setting_protocol = properties.getProperty("Info360_Setting.protocol");
		String Info360_Setting_hostname = properties.getProperty("Info360_Setting.hostname");
		String Info360_Setting_port = properties.getProperty("Info360_Setting.port");

		model.addAttribute("websocket_hostname", websocket_hostname);
		model.addAttribute("websocket_protocol", websocket_protocol);
		model.addAttribute("websocket_port", websocket_port);

		model.addAttribute("Info360_Setting_protocol", Info360_Setting_protocol);
		model.addAttribute("Info360_Setting_hostname", Info360_Setting_hostname);
		model.addAttribute("Info360_Setting_port", Info360_Setting_port);

		return "main_view"; // 頁面導向 /WEB-INF/views/ 搜索檔案類型.jsp
	}

	/*--------- Tab 分頁導頁控制區 ----------*/
	
	/**
	 * 「儀表板」頁面
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "dashboard")
	public String showDashBoard(Model model) {
		// 取得設定參數
		getProperties();

		String IMWebSocket_protocol = properties.getProperty("IMWebSocket.protocol");
		String IMWebSocket_hostname = properties.getProperty("IMWebSocket.hostname");
		String IMWebSocket_port = properties.getProperty("IMWebSocket.port");

		model.addAttribute("IMWebSocket_protocol", IMWebSocket_protocol);
		model.addAttribute("IMWebSocket_hostname", IMWebSocket_hostname);
		model.addAttribute("IMWebSocket_port", IMWebSocket_port);

		return "info360/dashboard";
	}

	/**
	 * 「案件搜尋」頁面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "query")
	public String showQuery(Model model) {
		// 取得設定參數
		getProperties();

		String IMWebSocket_protocol = properties.getProperty("IMWebSocket.protocol");
		String IMWebSocket_hostname = properties.getProperty("IMWebSocket.hostname");
		String IMWebSocket_port = properties.getProperty("IMWebSocket.port");

		model.addAttribute("IMWebSocket_protocol", IMWebSocket_protocol);
		model.addAttribute("IMWebSocket_hostname", IMWebSocket_hostname);
		model.addAttribute("IMWebSocket_port", IMWebSocket_port);

		return "info360/query";
	}

	/**
	 * 「設定」頁面
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "setting")
	public String showSetting(Model model) {
		// 取得設定參數
		getProperties();

		String IMWebSocket_protocol = properties.getProperty("IMWebSocket.protocol");
		String IMWebSocket_hostname = properties.getProperty("IMWebSocket.hostname");
		String IMWebSocket_port = properties.getProperty("IMWebSocket.port");

		String Info360_Setting_protocol = properties.getProperty("Info360_Setting.protocol");
		String Info360_Setting_hostname = properties.getProperty("Info360_Setting.hostname");
		String Info360_Setting_port = properties.getProperty("Info360_Setting.port");

		model.addAttribute("IMWebSocket_protocol", IMWebSocket_protocol);
		model.addAttribute("IMWebSocket_hostname", IMWebSocket_hostname);
		model.addAttribute("IMWebSocket_port", IMWebSocket_port);

		model.addAttribute("Info360_Setting_protocol", Info360_Setting_protocol);
		model.addAttribute("Info360_Setting_hostname", Info360_Setting_hostname);
		model.addAttribute("Info360_Setting_port", Info360_Setting_port);

		return "info360/setting";
	}
	
	/**
	 * 「設定」測試頁面
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "testsetting")
	public String showTestSetting(Model model) {
		// 取得設定參數
		getProperties();

		String IMWebSocket_protocol = properties.getProperty("IMWebSocket.protocol");
		String IMWebSocket_hostname = properties.getProperty("IMWebSocket.hostname");
		String IMWebSocket_port = properties.getProperty("IMWebSocket.port");

		String Info360_Setting_protocol = properties.getProperty("Info360_Setting.protocol");
		String Info360_Setting_hostname = properties.getProperty("Info360_Setting.hostname");
		String Info360_Setting_port = properties.getProperty("Info360_Setting.port");

		model.addAttribute("IMWebSocket_protocol", IMWebSocket_protocol);
		model.addAttribute("IMWebSocket_hostname", IMWebSocket_hostname);
		model.addAttribute("IMWebSocket_port", IMWebSocket_port);

		model.addAttribute("Info360_Setting_protocol", Info360_Setting_protocol);
		model.addAttribute("Info360_Setting_hostname", Info360_Setting_hostname);
		model.addAttribute("Info360_Setting_port", Info360_Setting_port);

		return "info360/testsetting";
	}

	/**
	 * 「忘記密碼」頁面
	 * @return
	 */
	@RequestMapping(value = "password")
	public String showPassowrd() {
		return "info360/password";
	}

	/*--------- Chat 分頁導頁控制區 ----------*/
	@RequestMapping(value = "chat1")
	public String showChatV1(@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "bhno", required = false) String bhno,
			@RequestParam(value = "bhnotype", required = false) String bhnotype,
			@RequestParam(value = "custfno", required = false) String custfno,
			@RequestParam(value = "custlevel", required = false) String custlevel,
			@RequestParam(value = "birth", required = false) String birth,
			@RequestParam(value = "mobtel", required = false) String mobtel,
			@RequestParam(value = "cattel", required = false) String cattel,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "interactionId", required = false) String interactionId, Model model)
					throws IOException {
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		model.addAttribute("address", address);
		model.addAttribute("bhno", bhno);
		model.addAttribute("bhnotype", bhnotype);
		model.addAttribute("custfno", custfno);
		model.addAttribute("custlevel", custlevel);
		model.addAttribute("birth", birth);
		model.addAttribute("mobtel", mobtel);
		model.addAttribute("cattel", cattel);
		model.addAttribute("email", email);
		model.addAttribute("interactionId", interactionId);

		// 取得設定參數
		getProperties();

		String IMWebSocket_protocol = properties.getProperty("IMWebSocket.protocol");
		String IMWebSocket_hostname = properties.getProperty("IMWebSocket.hostname");
		String IMWebSocket_port = properties.getProperty("IMWebSocket.port");

		model.addAttribute("IMWebSocket_protocol", IMWebSocket_protocol);
		model.addAttribute("IMWebSocket_hostname", IMWebSocket_hostname);
		model.addAttribute("IMWebSocket_port", IMWebSocket_port);

		return "info360/chat/chat_v1";
	}

	@RequestMapping(value = "chat2")
	public String showChatV2(@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "bhno", required = false) String bhno,
			@RequestParam(value = "bhnotype", required = false) String bhnotype,
			@RequestParam(value = "custfno", required = false) String custfno,
			@RequestParam(value = "custlevel", required = false) String custlevel,
			@RequestParam(value = "birth", required = false) String birth,
			@RequestParam(value = "mobtel", required = false) String mobtel,
			@RequestParam(value = "cattel", required = false) String cattel,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "interactionId", required = false) String interactionId, Model model)
					throws IOException {
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		model.addAttribute("address", address);
		model.addAttribute("bhno", bhno);
		model.addAttribute("bhnotype", bhnotype);
		model.addAttribute("custfno", custfno);
		model.addAttribute("custlevel", custlevel);
		model.addAttribute("birth", birth);
		model.addAttribute("mobtel", mobtel);
		model.addAttribute("cattel", cattel);
		model.addAttribute("email", email);
		model.addAttribute("interactionId", interactionId);

		// 取得設定參數
		getProperties();

		String IMWebSocket_protocol = properties.getProperty("IMWebSocket.protocol");
		String IMWebSocket_hostname = properties.getProperty("IMWebSocket.hostname");
		String IMWebSocket_port = properties.getProperty("IMWebSocket.port");

		model.addAttribute("IMWebSocket_protocol", IMWebSocket_protocol);
		model.addAttribute("IMWebSocket_hostname", IMWebSocket_hostname);
		model.addAttribute("IMWebSocket_port", IMWebSocket_port);

		return "info360/chat/chat_v2";
	}

	@RequestMapping(value = "chat3")
	public String showChatV3(@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "bhno", required = false) String bhno,
			@RequestParam(value = "bhnotype", required = false) String bhnotype,
			@RequestParam(value = "custfno", required = false) String custfno,
			@RequestParam(value = "custlevel", required = false) String custlevel,
			@RequestParam(value = "birth", required = false) String birth,
			@RequestParam(value = "mobtel", required = false) String mobtel,
			@RequestParam(value = "cattel", required = false) String cattel,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "interactionId", required = false) String interactionId, Model model)
					throws IOException {
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		model.addAttribute("address", address);
		model.addAttribute("bhno", bhno);
		model.addAttribute("bhnotype", bhnotype);
		model.addAttribute("custfno", custfno);
		model.addAttribute("custlevel", custlevel);
		model.addAttribute("birth", birth);
		model.addAttribute("mobtel", mobtel);
		model.addAttribute("cattel", cattel);
		model.addAttribute("email", email);
		model.addAttribute("interactionId", interactionId);

		// 取得設定參數
		getProperties();

		String IMWebSocket_protocol = properties.getProperty("IMWebSocket.protocol");
		String IMWebSocket_hostname = properties.getProperty("IMWebSocket.hostname");
		String IMWebSocket_port = properties.getProperty("IMWebSocket.port");

		model.addAttribute("IMWebSocket_protocol", IMWebSocket_protocol);
		model.addAttribute("IMWebSocket_hostname", IMWebSocket_hostname);
		model.addAttribute("IMWebSocket_port", IMWebSocket_port);

		return "info360/chat/chat_v3";
	}

	@RequestMapping(value = "chat4")
	public String showChatV4(@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "bhno", required = false) String bhno,
			@RequestParam(value = "bhnotype", required = false) String bhnotype,
			@RequestParam(value = "custfno", required = false) String custfno,
			@RequestParam(value = "custlevel", required = false) String custlevel,
			@RequestParam(value = "birth", required = false) String birth,
			@RequestParam(value = "mobtel", required = false) String mobtel,
			@RequestParam(value = "cattel", required = false) String cattel,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "interactionId", required = false) String interactionId, Model model)
					throws IOException {
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		model.addAttribute("address", address);
		model.addAttribute("bhno", bhno);
		model.addAttribute("bhnotype", bhnotype);
		model.addAttribute("custfno", custfno);
		model.addAttribute("custlevel", custlevel);
		model.addAttribute("birth", birth);
		model.addAttribute("mobtel", mobtel);
		model.addAttribute("cattel", cattel);
		model.addAttribute("email", email);
		model.addAttribute("interactionId", interactionId);

		// 取得設定參數
		getProperties();

		String IMWebSocket_protocol = properties.getProperty("IMWebSocket.protocol");
		String IMWebSocket_hostname = properties.getProperty("IMWebSocket.hostname");
		String IMWebSocket_port = properties.getProperty("IMWebSocket.port");

		model.addAttribute("IMWebSocket_protocol", IMWebSocket_protocol);
		model.addAttribute("IMWebSocket_hostname", IMWebSocket_hostname);
		model.addAttribute("IMWebSocket_port", IMWebSocket_port);

		return "info360/chat/chat_v4";
	}

	@RequestMapping(value = "chat5")
	public String showChatV5(@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "bhno", required = false) String bhno,
			@RequestParam(value = "bhnotype", required = false) String bhnotype,
			@RequestParam(value = "custfno", required = false) String custfno,
			@RequestParam(value = "custlevel", required = false) String custlevel,
			@RequestParam(value = "birth", required = false) String birth,
			@RequestParam(value = "mobtel", required = false) String mobtel,
			@RequestParam(value = "cattel", required = false) String cattel,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "interactionId", required = false) String interactionId, Model model)
					throws IOException {
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		model.addAttribute("address", address);
		model.addAttribute("bhno", bhno);
		model.addAttribute("bhnotype", bhnotype);
		model.addAttribute("custfno", custfno);
		model.addAttribute("custlevel", custlevel);
		model.addAttribute("birth", birth);
		model.addAttribute("mobtel", mobtel);
		model.addAttribute("cattel", cattel);
		model.addAttribute("email", email);
		model.addAttribute("interactionId", interactionId);

		// 取得設定參數
		getProperties();

		String IMWebSocket_protocol = properties.getProperty("IMWebSocket.protocol");
		String IMWebSocket_hostname = properties.getProperty("IMWebSocket.hostname");
		String IMWebSocket_port = properties.getProperty("IMWebSocket.port");

		model.addAttribute("IMWebSocket_protocol", IMWebSocket_protocol);
		model.addAttribute("IMWebSocket_hostname", IMWebSocket_hostname);
		model.addAttribute("IMWebSocket_port", IMWebSocket_port);

		return "info360/chat/chat_v5";
	}

	/**
	 * 取得參數設定
	 * 
	 * @return Properties
	 */
	private Properties getProperties() {
		if (properties == null) {
			String propFileName = "config.properties";
			InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);

			try {
				if (inputStream != null) {
					properties = new Properties();
					properties.load(inputStream);
				}
			} catch (IOException e) {
				System.out.println("IOException : " + e.getMessage());
			}
		}

		return properties;
	}

}