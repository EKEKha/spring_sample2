package com.web.user.mail;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import com.web.mappers.MemberMapper;
import com.web.util.SHA256;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.web.vo.MemberVO;



@Service
public class UserMailSendService {


	@Autowired
	private MemberMapper mapper;
	/*
	 * @Autowired private SqlSessionTemplate sqlSession;
	 */


	@Autowired
	private JavaMailSender mailSender;





	//이메일 난수 만드는 서비스

	private String init() {
		Random ran=new Random();
		StringBuffer sb=new StringBuffer();
		int num=0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}

		return sb.toString();


	}


	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	/*// 회원가입 발송 이메일(인증키 발송)
		public void mailSendWithUserKey(String e_mail, String user_id, HttpServletRequest request) {

			String key = getKey(false, 10);
			userDao = sqlSession.getMapper(UserDaoInterface.class);
			userDao.GetKey(user_id, key);
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요 MS :p 민수르~ 입니다!</h2><br><br>"
					+ "<h3>" + user_id + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : "
					+ "<a href='http://localhost:8080" + request.getContextPath() + "/user/key_alter?user_id="+ user_id +"&user_key="+key+"'>인증하기</a></p>"
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			try {
				mail.setSubject("[본인인증] MS :p 민수르님의 인증메일입니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(e_mail));
				mailSender.send(mail);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			}
			*/


	// 패스워드 찾기 이메일 발송
	public void mailSendWithPassword(MemberVO findVO, HttpServletRequest request)throws Exception {
		// 비밀번호는 6자리로 보내고 데이터베이스 비밀번호를 바꿔준다
		String key = getKey(false, 6);


		// 회원 이름 꺼내는 코드

		String name = findVO.getMem_name();

		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 '"+ name +"' 님</h2><br><br>"
				+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
				+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + key +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
				+ "<h3><a href='http://localhost/login'>로그인하러가기</a></h3><br><br>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[Tennis Shop] 임시 비밀번호가 발급되었습니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(findVO.getMem_email()));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		// 비밀번호 암호화해주는 메서드
		key = SHA256.encodeSHA256(key);
		//받은 VO 객체에 암호화된 key를 셋팅
		findVO.setMem_pwd(key);
		// 데이터 베이스 값은 암호한 값으로 저장시킨다.
		mapper.updatePwd(findVO);

	}


}
