package DAO.data_JavaBean;

import java.util.List;

public class Pager {
    private int totalRows;//记录总数
    private int pageSize = 10;//设置一页显示的记录数
    private int currentPage;//当前页码
    private int totalPages;//总页数
    private int startRow;//当前页码开始记录数
    private List elements;//记录列表
    public Pager() {
    }
    //构造pager对象
    /**
     * 初始化Pager，在构造器中初始化变量
     */
    public Pager(int _totalRows) {
        totalRows = _totalRows;
        totalPages=totalRows/pageSize;
        int mod=totalRows%pageSize;
        if(mod>0){
            totalPages++;  //这个就是  totalPages = totalPages +1；
        }                  //
        currentPage = 1;
        startRow = 0;
    }

    //首页
    public void first() {
        currentPage = 1;
        startRow = 0;
    }
    //上一页
    public void previous() {
        if (currentPage == 1) {
            return;
        }
        currentPage--;
        startRow = (currentPage - 1) * pageSize;
    }
    //下一页
    public void next() {
        if (currentPage < totalPages) {
            currentPage++;
        }
        startRow = (currentPage - 1) * pageSize;
    }
    //尾页
    public void last() {
        currentPage = totalPages;
        startRow = (currentPage - 1) * pageSize;
    }
    //刷新pager对象
    public void refresh(int _currentPage) {
        currentPage = _currentPage;
        if (currentPage > totalPages) {
            last();
        }
    }

    public int getStartRow() {
        return startRow;
    }
    public int getTotalPages() {
        return totalPages;
    }
    public int getCurrentPage() {
        return currentPage;
    }
    public int getPageSize() {
        return pageSize;
    }
    public void setTotalRows(int totalRows) {
        this.totalRows = totalRows;
    }
    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }
    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    public int getTotalRows() {
        return totalRows;
    }
    public List getList() {
        return elements;
    }
    public void setList(List elements) {
        this.elements=elements;
    }
}
