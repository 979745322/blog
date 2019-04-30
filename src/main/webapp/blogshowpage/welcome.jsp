<%@ page import="com.rex.blog.mapper.AccessMapper" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.rex.blog.service.impl.AccessServiceImpl" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="com.rex.blog.service.AccessService" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.ProtocolException" %>
<%@ page import="java.net.MalformedURLException" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %><%--
  Created by IntelliJ IDEA.
  User: rex.li
  Date: 2019/4/16
  Time: 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="no-js">
<head>
    <!-- welcome.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogshowpage/css/welcomepage.css">
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/blogshowpage/js/jquery.min.js"></script>

</head>
<body class="body_welcome">
<iframe id="iframe_welcome" width="100%" height="100%"
        src="${pageContext.request.contextPath}/blogpage/welcomeBlogPage" frameborder="0"
        data-id="${pageContext.request.contextPath}/blogpage/welcomeBlogPage" seamless></iframe>
<%!
    public String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip.equals("0:0:0:0:0:0:0:1") ? "127.0.0.1" : ip;
    }

    public JSONObject getAddressByIp(String IP){
        JSONObject obj2 = null;
        try{
            String str = getJsonContent("http://ip.taobao.com/service/getIpInfo.php?ip="+IP);
            System.out.println(str);
            JSONObject obj = new JSONObject(str);
            obj2 =  (JSONObject) obj.get("data");
        }catch(Exception e){
            e.printStackTrace();
        }
        return obj2;
    }

    public static String getJsonContent(String urlStr)
    {
        try
        {// 获取HttpURLConnection连接对象
            URL url = new URL(urlStr);
            HttpURLConnection httpConn = (HttpURLConnection) url
                    .openConnection();
            // 设置连接属性
            httpConn.setConnectTimeout(3000);
            httpConn.setDoInput(true);
            httpConn.setRequestMethod("GET");
            // 获取相应码
            int respCode = httpConn.getResponseCode();
            if (respCode == 200)
            {
                return ConvertStream2Json(httpConn.getInputStream());
            }
        }
        catch (MalformedURLException e)
        {
            e.printStackTrace();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        return "";
    }
    private static String ConvertStream2Json(InputStream inputStream)
    {
        String jsonStr = "";
        // ByteArrayOutputStream相当于内存输出流
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int len = 0;
        // 将输入流转移到内存输出流中
        try
        {
            while ((len = inputStream.read(buffer, 0, buffer.length)) != -1)
            {
                out.write(buffer, 0, len);
            }
            // 将内存流转换为字符串
            jsonStr = new String(out.toByteArray());
        }
        catch (IOException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return jsonStr;
    }

%>
<%
    if (session.isNew()) {
        String ip = getIpAddr(request);
        ApplicationContext ctx =
                WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
        assert ctx != null;
        AccessService accessService = (AccessService) ctx.getBean("accessService");
//        accessService.addAccess(ip);
        JSONObject obj = getAddressByIp(ip);
        //ip country region city county isp
        accessService.addAccess(ip,String.valueOf(obj.get("country")),String.valueOf(obj.get("region")),String.valueOf(obj.get("city")),String.valueOf(obj.get("county")),String.valueOf(obj.get("isp")));
    }
%>

<!-- 自定义 JS -->
<script src="${pageContext.request.contextPath}/blogshowpage/js/welcomepage.js"></script>
<script>
    // 判断是否为移动端运行环境
    if(/AppleWebKit.*Mobile/i.test(navigator.userAgent) || (/MIDP|SymbianOS|NOKIA|SAMSUNG|LG|NEC|TCL|Alcatel|BIRD|DBTEL|Dopod|PHILIPS|HAIER|LENOVO|MOT-|Nokia|SonyEricsson|SIE-|Amoi|ZTE/.test(navigator.userAgent))){
        if(window.location.href.indexOf("?mobile")<0){
            try{
                window.location.href="/blogpage/welcomeBlogPage";
                /*if(/Android|webOS|iPhone|iPod|iPad|BlackBerry/i.test(navigator.userAgent)){
                    // 判断访问环境是 Android|webOS|iPhone|iPod|BlackBerry 则加载以下样式
                }
                else{
                    // 判断访问环境是 其他移动设备 则加载以下样式
                }*/
            }
            catch(e){}
        }
    }
</script>
</body>
</html>


