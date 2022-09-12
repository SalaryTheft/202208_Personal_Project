package com.cvsone.user.vo;

public class UserVO {
    private String userId;
    private String userPw;

    public UserVO(String userId, String userPw) {
        this.userId = userId;
        this.userPw = userPw;
    }

    @Override
    public String toString() {
        return "UserVO{" +
                "userId='" + userId + '\'' +
                ", userPw='" + userPw + '\'' +
                '}';
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPw() {
        return userPw;
    }

    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }

    public boolean isValidUser(){
        boolean isValid = userId != null && !userId.isEmpty();
        if (userPw == null || userPw.isEmpty()){
            isValid = false;
        }
        if (userId.length() < 4){
            isValid = false;
        }
        if (userPw.length() < 4){
            isValid = false;
        }
        // 비밀번호에는 특수문자가 1개 이상 숫자가 1개 이상 있어야 됨
        boolean hasSpecialChar = false;
        boolean hasNumber = false;
        for (int i = 0; i < userPw.length(); i++){
            if (userPw.charAt(i) >= '!' && userPw.charAt(i) <= '~'){
                hasSpecialChar = true;
            }
            if (userPw.charAt(i) >= '0' && userPw.charAt(i) <= '9'){
                hasNumber = true;
            }
        }
        if (!hasSpecialChar || !hasNumber){
            isValid = false;
        }
        return isValid;
    }
}
