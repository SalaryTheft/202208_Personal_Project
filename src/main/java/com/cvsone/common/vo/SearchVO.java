package com.cvsone.common.vo;

public class SearchVO {
    private String keyword; // 검색어
    private String type; // 종류(제목, 작성자, 내용)
    private String category; // 카테고리

    private int page = 1; // 현재 페이지
    private int rowsPerPage = 10; // 한 페이지당 게시글 수
    private int pageSize = 5; // 보여줄 페이지 수
    private int totalRows; // (검색 후) 총 게시글 수

    private int firstPage;
    private int lastPage;
    private int firstRow;
    private int lastRow;
    private int totalPages;

    @Override
    public String toString() {
        return "SearchVO [keyword=" + keyword + ", type=" + type + ", category=" + category + ", page=" + page
                + ", rowsPerPage=" + rowsPerPage + ", pageSize=" + pageSize + ", totalRows=" + totalRows + ", firstRow="
                + firstRow + ", lastRow=" + lastRow + ", totalPages=" + totalPages + ", firstPage=" + firstPage
                + ", lastPage=" + lastPage + "]";
    }

    public void setPages() {
        totalPages = (totalRows - 1) / rowsPerPage + 1;

        firstRow = (page - 1) * rowsPerPage + 1;
        lastRow = firstRow + rowsPerPage - 1;
        if (lastRow > totalRows)
            lastRow = totalRows;

        firstPage = (page - 1) / pageSize * pageSize + 1;
        lastPage = firstPage + pageSize - 1;
        if (lastPage > totalPages)
            lastPage = totalPages;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRowsPerPage() {
        return rowsPerPage;
    }

    public void setRowsPerPage(int rowsPerPage) {
        this.rowsPerPage = rowsPerPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalRows() {
        return totalRows;
    }

    public void setTotalRows(int totalRows) {
        this.totalRows = totalRows;
    }

    public int getFirstRow() {
        return firstRow;
    }

    public void setFirstRow(int firstRow) {
        this.firstRow = firstRow;
    }

    public int getLastRow() {
        return lastRow;
    }

    public void setLastRow(int lastRow) {
        this.lastRow = lastRow;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public int getFirstPage() {
        return firstPage;
    }

    public void setFirstPage(int firstPage) {
        this.firstPage = firstPage;
    }

    public int getLastPage() {
        return lastPage;
    }

    public void setLastPage(int lastPage) {
        this.lastPage = lastPage;
    }
}
