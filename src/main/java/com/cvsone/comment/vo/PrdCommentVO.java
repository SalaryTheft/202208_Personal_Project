package com.cvsone.comment.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class PrdCommentVO {
    private String userId;
    private String commentContent;
    private String commentRegdate;
    private String prdName;
    private String commentUuid;

    public PrdCommentVO(String userId, String commentContent, String prdName) {
        this.userId = userId;
        this.commentContent = commentContent;
        this.prdName = prdName;
    }

    @Override
    public String toString() {
        return "PrdCommentVO{" +
                "userId='" + userId + '\'' +
                ", commentContent='" + commentContent + '\'' +
                ", commentRegdate='" + commentRegdate + '\'' +
                ", prdName='" + prdName + '\'' +
                ", commentUuid='" + commentUuid + '\'' +
                '}';
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

    public String getPrdName() {
        return prdName;
    }

    public void setPrdName(String prdName) {
        this.prdName = prdName;
    }

    public String getCommentUuid() {
        return commentUuid;
    }

    public void setCommentUuid(String commentUuid) {
        this.commentUuid = commentUuid;
    }

    public String getEncodedPrdName() throws UnsupportedEncodingException {
        return URLEncoder.encode(prdName, "UTF-8");
    }
}
