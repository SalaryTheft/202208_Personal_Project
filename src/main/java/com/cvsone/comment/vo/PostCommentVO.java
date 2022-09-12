package com.cvsone.comment.vo;

public class PostCommentVO {
    private String userId;
    private String commentContent;

    private String commentRegdate;
    private int postNo;
    private String commentUuid;
    private String parentUuid = "0";
    private int commentLevel;
    private String parentUserId;


    @Override
    public String toString() {
        return "PostCommentVO{" + "userId='" + userId + '\'' + ", commentContent='" + commentContent + '\'' + ", commentRegdate='" + commentRegdate + '\'' + ", postNo='" + postNo + '\'' + ", commentUuid='" + commentUuid + '\'' + '}';
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getCommentRegdate() {
        return commentRegdate;
    }

    public void setCommentRegdate(String commentRegdate) {
        this.commentRegdate = commentRegdate;
    }

    public int getPostNo() {
        return postNo;
    }

    public void setPostNo(int postNo) {
        this.postNo = postNo;
    }

    public String getCommentUuid() {
        return commentUuid;
    }

    public void setCommentUuid(String commentUuid) {
        this.commentUuid = commentUuid;
    }

    public String getParentUuid() {
        return parentUuid;
    }

    public void setParentUuid(String parentUuid) {
        this.parentUuid = parentUuid;
    }

    public int getCommentLevel() {
        return commentLevel;
    }

    public void setCommentLevel(int commentLevel) {
        this.commentLevel = commentLevel;
    }

    public String getParentUserId() {
        return parentUserId;
    }

    public void setParentUserId(String parentUserId) {
        this.parentUserId = parentUserId;
    }
}
