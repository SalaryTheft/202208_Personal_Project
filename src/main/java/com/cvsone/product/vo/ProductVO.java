package com.cvsone.product.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class ProductVO {
    private String prdName;
    private int prdPrice;
    private int prdEventPrice;
    private String prdEventType;
    private String prdGiftName;
    private int prdGiftPrice;
    private String prdImg;
    private int commentCount;

    @Override
    public String toString() {
        return "ProductVO{" + "prdName='" + prdName + '\'' + ", prdPrice=" + prdPrice + ", prdEvent_price=" + prdEventPrice + ", prdEventType='" + prdEventType + '\'' + ", prdGiftName='" + prdGiftName + '\'' + ", prdGiftPrice=" + prdGiftPrice + ", prdImg='" + prdImg + '\'' + '}';
    }

    public String getPrdName() {
        return prdName;
    }

    public void setPrdName(String prdName) {
        this.prdName = prdName;
    }

    public String getEncodedPrdName() throws UnsupportedEncodingException {
        return URLEncoder.encode(prdName, "UTF-8");
    }

    public int getPrdPrice() {
        return prdPrice;
    }

    public void setPrdPrice(int prdPrice) {
        this.prdPrice = prdPrice;
    }

    public int getPrdEventPrice() {
        return prdEventPrice;
    }

    public void setPrdEventPrice(int prdEventPrice) {
        this.prdEventPrice = prdEventPrice;
    }

    public String getPrdEventType() {
        return prdEventType;
    }

    public void setPrdEventType(String prdEventType) {
        this.prdEventType = prdEventType;
    }

    public String getPrdGiftName() {
        return prdGiftName;
    }

    public void setPrdGiftName(String prdGiftName) {
        this.prdGiftName = prdGiftName;
    }

    public int getPrdGiftPrice() {
        return prdGiftPrice;
    }

    public void setPrdGiftPrice(int prdGiftPrice) {
        this.prdGiftPrice = prdGiftPrice;
    }

    public String getPrdImg() {
        return prdImg;
    }

    public void setPrdImg(String prdImg) {
        this.prdImg = prdImg;
    }

    public int getCommentCount() { return commentCount; }

    public void setCommentCount(int commentCount) { this.commentCount = commentCount; }
}
