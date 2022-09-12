package com.cvsone.user.web;

import com.cvsone.user.dao.IUserDAO;
import com.cvsone.user.vo.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class UserController {

    @Inject
    IUserDAO userDAO;

    @RequestMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response, String userId, String userPw, String saveId) {
        if (request.getMethod().equals("POST")) {
            Cookie saveIdCookie = new Cookie("SAVE_ID", userId);
            if (saveId != null) {
                response.addCookie(saveIdCookie);
            } else {
                saveIdCookie.setMaxAge(0);
                response.addCookie(saveIdCookie);
            }
            UserVO user = userDAO.getUserById(userId);
            if (user != null && user.getUserPw().equals(userPw)) {
                request.getSession().setAttribute("USER", user);
                return "redirect:/";
            } else {
                request.setAttribute("msg", "아이디 또는 비밀번호가 올바르지 않습니다.");
                request.setAttribute("url", "/login");
                return "alert";
            }
        }
        return "user/login";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/";
    }

    @GetMapping("/register")
    public String register() {
        return "user/register";
    }

    @PostMapping(value = "/register", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String registerForm(String userId, String userPw) {
        UserVO originUser = userDAO.getUserById(userId);
        if (originUser != null) {
            return "{\"result\":\"fail\",\"msg\":\"이미 존재하는 아이디입니다.\"}";
        } else {
            UserVO user = new UserVO(userId, userPw);
            int result = userDAO.insertUser(user);
            if (result == 1) {
                return "{\"result\":\"success\"}";
            } else {
                return "{\"result\":\"fail\",\"msg\":\"회원가입에 실패하였습니다.\"}";
            }
        }
    }

    @GetMapping("/profile")
    public String profile(HttpServletRequest request) {
        if (request.getSession().getAttribute("USER") == null) {
            request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
            request.setAttribute("url", "/login");
            return "alert";
        }
        return "user/profile";
    }

    @PostMapping(value = "/profile/update", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String profileUpdate(HttpServletRequest request, String userPwOld, String userPw) {
        UserVO user = (UserVO) request.getSession().getAttribute("USER");
        if (user == null) {
            return "{\"result\":\"fail\",\"msg\":\"로그인이 필요한 서비스입니다.\"}";
        }
        if (user.getUserPw().equals(userPwOld)) {
            user.setUserPw(userPw);
            int result = userDAO.updateUser(user);
            if (result == 1) {
                request.getSession().setAttribute("USER", user);
                return "{\"result\":\"success\"}";
            } else {
                return "{\"result\":\"fail\",\"msg\":\"회원정보 수정 중 오류가 발생했습다.\"}";
            }
        } else {
            return "{\"result\":\"fail\",\"msg\":\"기존 비밀번호가 올바르지 않습니다.\"}";
        }
    }

    @PostMapping(value = "/profile/delete", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String profileDelete(HttpServletRequest request, String userPw) {
        UserVO user = (UserVO) request.getSession().getAttribute("USER");
        if (user == null) {
            return "{\"result\":\"fail\",\"msg\":\"로그인이 필요한 서비스입니다.\"}";
        }
        if (user.getUserPw().equals(userPw)) {
            int result = userDAO.deleteUser(user.getUserId());
            if (result == 1) {
                request.getSession().invalidate();
                return "{\"result\":\"success\"}";
            } else {
                return "{\"result\":\"fail\",\"msg\":\"회원탈퇴 중 오류가 발생했습다.\"}";
            }
        }
        return "{\"result\":\"fail\",\"msg\":\"비밀번호가 올바르지 않습니다.\"}";
    }

    @PostMapping(value = "/register/check_id", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String checkId(String userId) {
        UserVO user = userDAO.getUserById(userId);
        if (user == null) {
            return "{\"result\":\"success\"}";
        } else {
            return "{\"result\":\"fail\",\"msg\":\"이미 사용 중인 아이디입니다.\"}";
        }
    }

}
