<%@page import="com.user.model.UserDAO"%>
<%@page import="com.user.model.UserDTO"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.json.JSONObject" %>
<%
    String clientId = "2mf3OCn4Fci2L2sZqAE_"; // 네이버 애플리케이션 클라이언트 아이디
    String clientSecret = "tkpvt_ME1J"; // 네이버 애플리케이션 클라이언트 시크릿
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8080/JEIU_FourSeasonsCafe/NaverCallback.jsp", "UTF-8");
    String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;

    String accessToken = "";
    StringBuffer responseBuffer = new StringBuffer();

    try {
        URL url = new URL(apiURL);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        int responseCode = con.getResponseCode();
        BufferedReader br;
        if (responseCode == 200) {
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else {
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        String inputLine;
        while ((inputLine = br.readLine()) != null) {
            responseBuffer.append(inputLine);
        }
        br.close();

        if (responseCode == 200) {
            JSONObject jsonObj = new JSONObject(responseBuffer.toString());
            accessToken = jsonObj.getString("access_token");
        } else {
            out.println("에러: " + responseBuffer.toString());
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Exception: " + e.getMessage());
    }

    if (!accessToken.equals("")) {
        String token = accessToken; // 네이버 로그인 접근 토큰
        String header = "Bearer " + token; // Bearer 다음에 공백 추가
        StringBuffer userInfoBuffer = new StringBuffer();

        try {
            String apiURL2 = "https://openapi.naver.com/v1/nid/me";
            URL url2 = new URL(apiURL2);
            HttpURLConnection con2 = (HttpURLConnection) url2.openConnection();
            con2.setRequestMethod("GET");
            con2.setRequestProperty("Authorization", header);
            int responseCode2 = con2.getResponseCode();
            BufferedReader br2;
            if (responseCode2 == 200) {
                br2 = new BufferedReader(new InputStreamReader(con2.getInputStream()));
            } else {
                br2 = new BufferedReader(new InputStreamReader(con2.getErrorStream()));
            }
            String inputLine2;
            while ((inputLine2 = br2.readLine()) != null) {
                userInfoBuffer.append(inputLine2);
            }
            br2.close();

            if (responseCode2 == 200) {
                JSONObject jsonObj2 = new JSONObject(userInfoBuffer.toString());
                JSONObject responseObj = jsonObj2.getJSONObject("response");

                String naverCode = responseObj.getString("id");
                String namez = responseObj.getString("name");
                String email = responseObj.getString("email");
                String birthyear = responseObj.getString("birthyear");
                String mobile = responseObj.getString("mobile");

                // 이미 해당 이메일로 사용자가 존재하는지 확인
                UserDAO userDAO = UserDAO.getInstance();
                boolean userExists = userDAO.checkUserExistsByEmail(email);

                UserDTO user = new UserDTO();
                if (userExists) {
                    // 이미 존재하면 로그인 처리
                    user = userDAO.getUserByEmail(email);
                } else {
                    // 존재하지 않으면 새로운 사용자 생성
                    int nextId = userDAO.getNextUserId();
                    user.setId(nextId);
                    user.setUserID(email);
                    user.setUserPW(naverCode.substring(0, 16));
                    user.setUserName(namez);
                    user.setUserBirth(birthyear);
                    user.setUserTel(mobile);
                    user.setEmail(email);
                    int result = userDAO.naver_join(user);
                    if (result >= 1) {
                        user = userDAO.getUserByEmail(email); // 새로 가입한 사용자 정보 조회
                    }
                }

                // 로그인 후 세션에 사용자 정보 설정
                session.setAttribute("user", user);
                response.sendRedirect("index.jsp");
            } else {
                out.println("네이버 API 호출에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Exception: " + e.getMessage());
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 로그인 Callback 페이지</title>
</head>
<body>
</body>
</html>