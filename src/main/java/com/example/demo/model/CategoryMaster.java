package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class CategoryMaster {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cid;
	private String categorycode;
	private String categoryname;
	private String altcategoryname;
	private String dscr;
	private String lastmodby;
	private String lastmoddate;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCategorycode() {
		return categorycode;
	}
	public void setCategorycode(String categorycode) {
		this.categorycode = categorycode;
	}
	public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	public String getAltcategoryname() {
		return altcategoryname;
	}
	public void setAltcategoryname(String altcategoryname) {
		this.altcategoryname = altcategoryname;
	}
	public String getDscr() {
		return dscr;
	}
	public void setDscr(String dscr) {
		this.dscr = dscr;
	}
	public String getLastmodby() {
		return lastmodby;
	}
	public void setLastmodby(String lastmodby) {
		this.lastmodby = lastmodby;
	}
	public String getLastmoddate() {
		return lastmoddate;
	}
	public void setLastmoddate(String lastmoddate) {
		this.lastmoddate = lastmoddate;
	}

}
