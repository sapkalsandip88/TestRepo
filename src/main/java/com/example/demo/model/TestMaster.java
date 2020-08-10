package com.example.demo.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TestMaster {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int tid;
	private String testcode;
	private String testname;
	private String altname;
	private String category;
	private String packages;
	private double actprice;
	private double discount;
	private double price;
	private int nop;
	private String male;
	private String female;
	private String age;
	private String prerequisite;
	private String dscr;
	private String lastmodby;
	private String lastmoddate;
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getTestcode() {
		return testcode;
	}
	public void setTestcode(String testcode) {
		this.testcode = testcode;
	}
	public String getTestname() {
		return testname;
	}
	public void setTestname(String testname) {
		this.testname = testname;
	}
	public String getAltname() {
		return altname;
	}
	public void setAltname(String altname) {
		this.altname = altname;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPackages() {
		return packages;
	}
	public void setPackages(String packages) {
		this.packages = packages;
	}
	public double getActprice() {
		return actprice;
	}
	public void setActprice(double actprice) {
		this.actprice = actprice;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getNop() {
		return nop;
	}
	public void setNop(int nop) {
		this.nop = nop;
	}
	public String getMale() {
		return male;
	}
	public void setMale(String male) {
		this.male = male;
	}
	public String getFemale() {
		return female;
	}
	public void setFemale(String female) {
		this.female = female;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getPrerequisite() {
		return prerequisite;
	}
	public void setPrerequisite(String prerequisite) {
		this.prerequisite = prerequisite;
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
	public void setLastmoddate(String string) {
		this.lastmoddate = lastmoddate;
	}
	@Override
	public String toString() {
		return "TestMaster [tid=" + tid + ", testname=" + testname + ", altname=" + altname + ", category=" + category
				+ ", packages=" + packages + ", actprice=" + actprice + ", discount=" + discount + ", price=" + price
				+ ", nop=" + nop + ", male=" + male + ", female=" + female + ", age=" + age + ", prerequisite="
				+ prerequisite + ", dscr=" + dscr + ", lastmodby=" + lastmodby + ", lastmoddate=" + lastmoddate + "]";
	}
	
	
}
