package com.web.user.member;

import com.web.user.mail.UserMailSendService;
import com.web.user.member.service.MemberService;
import com.web.util.SHA256;
import com.web.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Controller
public class MemberController {


	@Autowired
	private MemberService memberServiceImpl;

	@Autowired
	private UserMailSendService mailSender;
	
	//login From
	@GetMapping("/login")
	public String loginForm(){
		return "member/loginForm";
	}
	
	//login처리
	@PostMapping("/login")
	public String login(MemberVO vo,HttpSession session,HttpServletResponse response)throws Exception{
		
		vo.setMem_pwd(SHA256.encodeSHA256(vo.getMem_pwd()));
		MemberVO loginVO=memberServiceImpl.login(vo);
		
		if(loginVO !=null) {
			session.setAttribute("login", loginVO);
			
			return "redirect:/Home";
		}else {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디 비밀번호가 틀립니다.'); </script>");
			out.flush();
			
			return "member/loginForm";
		}
	}
	
	//logout
	@GetMapping("/logout")
		public String logout(HttpSession session)throws Exception{
			session.invalidate();
			return "redirect:/Home";
		}
	
	//회원가입 폼
	@GetMapping("/joinForm")
	public String joinForm() {
		return"member/joinForm";
	}
	
	//아이디 중복검사
	@GetMapping("/joinIdCheck")
	public String idCheck(MemberVO vo,Model model)throws Exception {
		model.addAttribute("vo", memberServiceImpl.idCheck(vo.getMem_id()));
		return"member/joinIdCheck";
	}
	
	//회원가입처리
	@RequestMapping(value = "/join", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String LoginCheck(Model model, MemberVO vo) throws Exception {

		vo.setMem_pwd(SHA256.encodeSHA256(vo.getMem_pwd()));
		//db 인설트처리
		
        try {
        	memberServiceImpl.join(vo);

            //로그인 성공
            model.addAttribute("msg","회원가입 성공");
            model.addAttribute("url","/login");

        } catch (Exception e) {

            //로그인 실패
            model.addAttribute("msg","로그인 실패");
            model.addAttribute("url","/joinForm");

        }

        return "redirect";

    }
	
	//아이디 찾기폼
	@GetMapping("/memberIdFindForm")
	public String findIdForm() {
		return "member/idFindForm";
	}
	
	//아이디 찾기처리
	@PostMapping("/idFind")
	public String findId(MemberVO vo,Model model,HttpServletResponse response) throws Exception {
		MemberVO findVO= memberServiceImpl.findId(vo);
	
		
		if(findVO !=null) {
			model.addAttribute("find", findVO);
			return "member/findId";
	
		}else {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디가 존재하지않습니다'); </script>");
			out.flush();
			
			return "member/idFindForm";
		}
		
	}
	
	//비밀번호 찾기폼
		@GetMapping("/memberPwFindForm")
		public String findPwForm() {
			return "member/pwFindForm";
		}
	
	//비밀번호 메일발송
		@PostMapping("memberpwFInd")
		public String findPw(MemberVO vo,HttpServletResponse response,HttpServletRequest request,Model model) throws Exception{
			MemberVO findVO= memberServiceImpl.findPw(vo);
			
			//해당메일에 임시비밀번호 발급
			if(findVO!=null) {
				
				mailSender.mailSendWithPassword(findVO, request);
			
				 model.addAttribute("msg","메일로 임시비밀번호를 발급하였습니다.");
				model.addAttribute("url","/login");
				 

			}else {
				model.addAttribute("msg","해당정보가 존재하지않습니다.");
	            model.addAttribute("url","/member/pwFindForm");
				
			}
			
			return "redirect";
			
		}
		
		
		
	
	//마이페이지-폼 불러오기요청,아이디찾기와 같은 db처리 
	@GetMapping("/mypage")
	public String myPage(String mem_id,Model model,MemberVO vo) throws Exception{

			model.addAttribute("my", memberServiceImpl.idCheck(mem_id));
			
			return "member/mypage";
		}
	
	//내정보수정
	@PostMapping("/updateMember")
		public String updateMember(MemberVO vo) throws Exception {
			
			memberServiceImpl.updateMem(vo);
			return "redirect:/mypage?mem_id="+vo.getMem_id();
		}
		
	
	//비밀번호변경:비밀번호 입력 폼불러오기
	@GetMapping("/changePwd")
	public String pwChangeForm() throws Exception{

			return "member/pwChange";
		}
	//비밀번호 변경처리
	@PostMapping("/changePwd")
	public String  pwChange(MemberVO vo) throws Exception {
		vo.setMem_pwd(SHA256.encodeSHA256(vo.getMem_pwd()));
		memberServiceImpl.updatePwd(vo);
		
		
			return "redirect:/Home";
		}
		
	
		
	//회원탈퇴
	@GetMapping("/deleteMember")
	public String deleteMem(HttpSession session,String mem_id) throws Exception {
		
		memberServiceImpl.deleteMem(mem_id);
		//세션삭제
		session.removeAttribute("login");
		
		//추후 탈퇴시 주문정보도 삭제
		
		return "redirect:/Home";
	}
}
