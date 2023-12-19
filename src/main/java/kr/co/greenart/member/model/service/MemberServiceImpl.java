package kr.co.greenart.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.lang.annotation.Retention;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import org.apache.ibatis.javassist.bytecode.stackmap.BasicBlock.Catch;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kr.co.greenart.common.MailUtils;
import kr.co.greenart.common.TempKey;
import kr.co.greenart.member.model.dao.MemberDao;
import kr.co.greenart.member.model.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession; //mybatis에서 사용되는 내장 템플릿
	
	@Autowired
	private MemberDao memberDao;
	
	@Inject
	private JavaMailSender mailSender;
	
	
	//로그인
	@Override
	public MemberDto loginMember(MemberDto m) {
		return memberDao.loginMember(sqlSession, m);
	}
	
	//sns(이메일)로그인
	@Override
	public MemberDto snsLoginMember(MemberDto m) {
		return memberDao.snsLoginMember(sqlSession, m);
	}
	
	//아이디 확인
	@Override
	public int checkId(String id) {
		return memberDao.checkId(sqlSession, id);
	}
	
	//이메일 확인
	@Override
	public int checkEmail(String email) {
		return memberDao.checkEmail(sqlSession, email);
	}

	//회원 가입 ( 사용 안함 )
	@Override
	public int signupMember(MemberDto memberDto) {
		return memberDao.signupMember(sqlSession, memberDto);
	}
	
	//id 찾기
	@Override
	public String findId(MemberDto memberdto) {
		
//		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out;
//		
//		try {
//			out = response.getWriter();
//			String id = memberDao.findId(sqlSession, memberName, memberEmail);
//			
//			if (id == null) {
//				out.println("<script>");
//				out.println("alert('가입된 아이디가 없습니다.');");
//				out.println("history.go(-1);");
//				out.println("</script>");
//				out.close();
//				return null;
//			} else {
//				return id;
//			}
//		} catch (IOException e) {
//		
//			e.printStackTrace();
//		}
//		return null;
		
		return memberDao.findId(sqlSession, memberdto);
	}

	//pw 찾기(사용 안함)
	@Override
	public String findPw(MemberDto memberdto) {
		return memberDao.findPw(sqlSession, memberdto);
	}

	//pw 찾기(회원번호 가져오기)
	@Override
	public String findIdx(MemberDto memberdto) {
		return memberDao.findIdx(sqlSession, memberdto);
	}
	
	//pw변경
	@Override
	public int changePw(MemberDto memberdto) {
		return memberDao.changePw(sqlSession, memberdto);
	}

	//마이페이지 보기
	@Override
	public MemberDto myPage(int memberIdx) {
		return memberDao.myPage(sqlSession, memberIdx);
	}
	
	//마이페이지 업데이트
	@Override
	public int updateMyPage(MemberDto memberdto) {
		return memberDao.updateMyPage(sqlSession, memberdto);
	}
	
	
	
	//이메일 인증
    @Override
	public void memberAuth(String memberEmail, String key) throws Exception{
		memberDao.memberAuth(sqlSession, memberEmail, key);
    }
    
    //이메일 발송
	@Override
	public void sendMail(MemberDto memberdto) throws Exception {
		memberDao.signupMember(sqlSession, memberdto);
		
		String key = new TempKey().getKey(50,false);
		memberDao.createAuthKey(sqlSession, memberdto.getMemberEmail(), key);
		
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("[쇼핑몰 프로젝트 이메일 인증 입니다.]"); //메일제목
		sendMail.setText(
				"<h1>메일인증</h1>" +
						"<br/>"+memberdto.getMemberId()+"님 "+
						"<br/>쇼핑몰 프로젝트에 회원가입 해주셔서 감사합니다."+
						"<br/>아래 [이메일 인증 확인]을 눌러주세요."+
						"<a href='http://localhost/member/emailConfirm?memberEmail=" + memberdto.getMemberEmail() +
						"&key=" + key +
						"' target='_blenk'><br>이메일 인증 확인</a>");
		sendMail.setFrom("shopprj2023@gmail.com", "[쇼핑몰 프로젝트]");
		sendMail.setTo(memberdto.getMemberEmail());
		sendMail.send();
	}
	
	//소셜 가입시 받은 데이터 insert
	@Override
	public int snsSingup(MemberDto memberdto) {
		return memberDao.snsSingup(sqlSession, memberdto);
	}
	
	// 카카오 로그인
	@Override
	public String getAccessTokenKakao(String authorize_code) throws Exception {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");

			sb.append("&client_id=f50e884d53d77ca3295d6fb79fda096c"); // REST_API키 본인이 발급받은 key 넣어주기
			sb.append("&redirect_uri=http://localhost/member/kakaoLogin"); // REDIRECT_URI 본인이 설정한 주소 넣어주기

			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// jackson objectmapper 객체 생성
			ObjectMapper objectMapper = new ObjectMapper();
			// JSON String -> Map
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});

			access_Token = jsonMap.get("access_token").toString();
			refresh_Token = jsonMap.get("refresh_token").toString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}

	@Override
	public HashMap<String, Object> getUserInfoKakao(String access_Token) throws Throwable {
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);


			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			try {
				// jackson objectmapper 객체 생성
				ObjectMapper objectMapper = new ObjectMapper();
				// JSON String -> Map
				Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
				});

				System.out.println(jsonMap.get("properties"));

				Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
				Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");

				// System.out.println(properties.get("nickname"));
				// System.out.println(kakao_account.get("email"));
				
//				String pw = jsonMap.get("id").toString();
				String email = kakao_account.get("email").toString();
//				String gender = kakao_account.get("gender").toString();


				int atIndex = email.indexOf('@'); // '@'의 인덱스를 찾습니다

				if (atIndex != -1) {
				    String id = email.substring(0, atIndex); // '@' 앞의 부분을 추출합니다
				    userInfo.put("id", id + "[kakao]");
				    
				    // 이제 'id' 변수를 사용할 수 있습니다
				    System.out.println("추출된 ID: " + id);
				} else {
				    System.out.println("유효한 이메일 형식이 아닙니다.");
//				    userInfo.put("id", pw);	 
				}
				

//				userInfo.put("nickname", nickname);
				userInfo.put("email", email);
//				userInfo.put("gender", gender);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}
	
	
	//네이버 로그인
	@Override
	public String getAccessTokenNaver(String authorize_code) throws Exception {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://nid.naver.com/oauth2.0/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");

			sb.append("&client_id=QOej8ZdoC6TIOyLYsN6p"); // REST_API키 본인이 발급받은 key 넣어주기
			sb.append("&client_secret=tWdZoqPOiE"); // REDIRECT_URI 본인이 설정한 주소 넣어주기

			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// jackson objectmapper 객체 생성
			ObjectMapper objectMapper = new ObjectMapper();
			// JSON String -> Map
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});

			access_Token = jsonMap.get("access_token").toString();
			refresh_Token = jsonMap.get("refresh_token").toString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
	
	@Override
	public HashMap<String, Object> getUserInfoNaver(String access_Token) throws Throwable {
			// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
			HashMap<String, Object> userInfo = new HashMap<String, Object>();
			String reqURL = "https://openapi.naver.com/v1/nid/me";
			
			String header = "Bearer " + access_Token;

			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");

				// 요청에 필요한 Header에 포함될 내용
				conn.setRequestProperty("Authorization", header);

				 int responseCode = conn.getResponseCode();
	             BufferedReader br;
	             if(responseCode==200) { // 정상 호출
	                 br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	             } else {  // 에러 발생
	                 br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	             }
	             String inputLine;
	             StringBuffer response = new StringBuffer();
	             while ((inputLine = br.readLine()) != null) {
	                 response.append(inputLine);
	             }
	             br.close();
	             ObjectMapper objectMapper = new ObjectMapper(); // Jackson 라이브러리 사용
	             try {
	            	    Map<String, Object> naverInfo = objectMapper.readValue(response.toString(), new TypeReference<Map<String, Object>>() {});
	            	    
	            	    // 'response' 맵 안의 데이터 가져오기
	            	    Map<String, Object> responseData = (Map<String, Object>) naverInfo.get("response");
	            	    
	            	    // response 데이터 확인
	            	    System.out.println("response 데이터: " + responseData);
	            	    
	            	    // response 안의 특정 데이터 가져오기
	            	    String id = "";
	            	    String pw = (String) responseData.get("id");
	            	    String gender = (String) responseData.get("gender");
	            	    String email = (String) responseData.get("email");
	            	    String name = (String) responseData.get("name");
	            	    String phoneNum = (String) responseData.get("mobile");
	            	    String birthday = (String) responseData.get("birthday");
	            	    String birthyear = (String) responseData.get("birthyear");
	            	    

	            	    
	            	    int atIndex = email.indexOf('@'); // '@'의 인덱스를 찾습니다

	    				if (atIndex != -1) {
	    				    id = email.substring(0, atIndex); // '@' 앞의 부분을 추출합니다
	    				    userInfo.put("id", id + "[naver]");	    
	    				    // 이제 'id' 변수를 사용할 수 있습니다
	    				    System.out.println("추출된 ID: " + id);
	    				} else {
	    				    System.out.println("유효한 이메일 형식이 아닙니다.");
	    				    userInfo.put("id", pw);	 
	    				}
	    				
	            	    System.out.println("ID: " + id);
	            	    System.out.println("Gender: " + gender);
	            	    System.out.println("Email: " + email);
	            	    System.out.println("Name: " + name);
	            	    System.out.println("phoneNum: " + phoneNum);
	            	    System.out.println("Birthday: " + birthday);
	            	    System.out.println("Birthyear: " + birthyear);
	            	    
	            	    
	            	    userInfo.put("pw", pw);
	    				userInfo.put("name", name);
	    				userInfo.put("phoneNum", phoneNum);
	    				userInfo.put("email", email);
	    				userInfo.put("gender", gender);
	    				userInfo.put("birthday", birthyear + "-" + birthday);
	    				System.out.println("Birthyear + Birthday: " + birthday);
	 			
	            	} catch (IOException e) {
	            	    System.out.println(e);
	            	}
	         } catch (Exception e) {
	             System.out.println(e);
	         }
			return userInfo;
		}

	// 회원 탈퇴
	@Override
	public int memberDelete(MemberDto bo) {
		return memberDao.memberDelete(sqlSession, bo);
	}
	
	// 회원 탈퇴 ( 이메일 인증 삭제 )
	@Override
	public int memberAuthDelete(MemberDto bo) {
		return memberDao.memberAuthDelete(sqlSession, bo);
	}
	
}
