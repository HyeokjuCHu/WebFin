package org.example.webfinal;

public class ImageVO {
    private int id;
    private String fileName;
    private String uploadDate;
    private String publishP;
    private int likeCnt;
    private int viewCnt;
    private int downCnt;
    private String camType;
    private String resolution;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(String uploadDate) {
        this.uploadDate = uploadDate;
    }

    public String getPublishP() {
        return publishP;
    }

    public void setPublishP(String publishP) {
        this.publishP = publishP;
    }

    public int getLikeCnt() {
        return likeCnt;
    }

    public void setLikeCnt(int likeCnt) {
        this.likeCnt = likeCnt;
    }

    public int getViewCnt() {
        return viewCnt;
    }

    public void setViewCnt(int viewCnt) {
        this.viewCnt = viewCnt;
    }

    public int getDownCnt() {
        return downCnt;
    }

    public void setDownCnt(int downCnt) {
        this.downCnt = downCnt;
    }

    public String getCamType() {
        return camType;
    }

    public void setCamType(String camType) {
        this.camType = camType;
    }

    public String getResolution() {
        return resolution;
    }

    public void setResolution(String resolution) {
        this.resolution = resolution;
    }
}
