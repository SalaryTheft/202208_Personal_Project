package com.cvsone.board.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PostVO {
    private int postNo;
    private String userId;
    private String postTitle;
    private String postContent;
    private int postHit;
    private String postRegdate;
    private String postCategory;
    private String postDelYn;
    private boolean isRecent;
    private int commentCount;

    @Override
    public String toString() {
        return "PostVO{" +
                "postNo=" + postNo +
                ", userId='" + userId + '\'' +
                ", postTitle='" + postTitle + '\'' +
                ", postContent='" + postContent + '\'' +
                ", postHit=" + postHit +
                ", postRegdate='" + postRegdate + '\'' +
                ", postCategory='" + postCategory + '\'' +
                ", postDelYn='" + postDelYn + '\'' +
                '}';
    }

    public int getPostNo() {
        return postNo;
    }

    public void setPostNo(int postNo) {
        this.postNo = postNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPostTitle() { return postTitle; }

    public void setPostTitle(String postTitle) { this.postTitle = postTitle; }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public int getPostHit() {
        return postHit;
    }

    public void setPostHit(int postHit) {
        this.postHit = postHit;
    }

    public String getPostRegdate() {
        return postRegdate;
    }

    public String getPostRegdateShort() throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date(sdf.parse(postRegdate).getTime());
        if (date.toString().substring(0, 10).equals(new Date().toString().substring(0, 10))) {
            return new SimpleDateFormat("HH:mm").format(date);
        } else {
            return new SimpleDateFormat("MM-dd").format(date);
        }
    }

    public void setPostRegdate(String postRegdate) {
        this.postRegdate = postRegdate;
    }

    public String getPostCategory() {
        return postCategory;
    }

    public String getPostCategoryName() {
        if (postCategory.equals("general")) {
            return "일반";
        } else if (postCategory.equals("notice")) {
            return "공지";
        } else if (postCategory.equals("qna")) {
            return "질문";
        } else {
            return "";
        }
    }

public String selected(String postCategory){
    return (postCategory.equals(this.postCategory)) ? "selected" : "";
}

    public void setPostCategory(String postCategory) {
        this.postCategory = postCategory;
    }

    public String getPostDelYn() {
        return postDelYn;
    }

    public void setPostDelYn(String postDelYn) {
        this.postDelYn = postDelYn;
    }

    public boolean getIsRecent() throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date(sdf.parse(postRegdate).getTime());
        return (new Date().getTime() - date.getTime()) < (1000 * 60 * 60 * 24 * 3);
    }

    public int getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }
}
