package com.my.model;

import java.util.ArrayList;
import java.util.List;

public class Page {
	
	/** 默认分页大小 */
	public static final int DEFAULT_PAGE_SIZE = 10;
	/** 返回数据，在EasyUI中是约定的名字的必须是rows */
	private List rows;
	/**   */
	private int start;
	/** 分页大小 */
	private int pageSize;
	/** 总记录数，在EasyUI中是约定的名字 */
	private int total;

	public Page() {
		this(new ArrayList(), 0, 0, DEFAULT_PAGE_SIZE);
	}

	public Page(List rows, int start, int total, int pageSize) {
		this.pageSize = DEFAULT_PAGE_SIZE;

		if (rows == null) {
			this.rows = new ArrayList();
		} else if (rows.size() <= pageSize) {
			this.rows = rows;
		} else {
			this.rows = new ArrayList();
			for (int i = start; (i < start + pageSize) && (i < rows.size()); ++i)
				this.rows.add(rows.get(i));
		}
		this.start = start;
		this.pageSize = ((pageSize > 0) ? pageSize : DEFAULT_PAGE_SIZE);
		this.total = total;
	}
	
	/** 获得分页大小 */
	public int getPageSize() {
		return pageSize;
	}

	/** 获得当前页码 */
	public int getCurrentPageNo() {
		return (this.start / this.pageSize + 1);
	}

	/** 获得最后一页的页码，即页数 */
	public int getLastPageNo() {
		return ((this.total + this.pageSize - 1) / this.pageSize);
	}
	
	/** 获得数据 */
	public List getRows() {
		return this.rows;
	}
	
	/** 设置数据 */
	public void setRows(List rows){
		this.rows=rows;
	}

	/** 获得总记录数 */
	public int getTotal() {
		return this.total;
	}
	
	/** 是否还有后一页 */
	public boolean hasNextPage() {
		return (getCurrentPageNo() < getLastPageNo());
	}

	/** 是否还有前一页 */
	public boolean hasPrevPage() {
		return (getCurrentPageNo() > 1);
	}

	/**
	 * 静态方法，根据页码得到起始记录号，默认分页大小为DEFAULT_PAGE_SIZE
	 * @param pageNo 页码
	 * @return 返回起始记录号
	 */
	public static int getStartOfPage(int pageNo) {
		return getStartOfPage(pageNo, DEFAULT_PAGE_SIZE);
	}
	
	/**
	 * 静态方法，根据页码和分页大小得到起始记录号
	 * @param pageNo 页码
	 * @param pageSize 分页大小
	 * @return 返回起始记录号
	 */
	public static int getStartOfPage(int pageNo, int pageSize) {
		return Math.max((pageNo - 1) * pageSize, 0);
	}
	

}
