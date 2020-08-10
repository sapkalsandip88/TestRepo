package com.example.demo.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class PackagesMasters {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int packageid;
	private String packagecode;
	private String packagename;
	private String altpname;
	private String category;
	private double actprice;
	private double discount;
	private double price;
	private int nooftest;
	private String male;
	private String female;
	private String age;
	private String prerequisite;
	private String dscr;
	private String lastmodby;
	private String lastmoddate;
	private String image;

	public int getPackageid() {
		return packageid;
	}
	public void setPackageid(int packageid) {
		this.packageid = packageid;
	}
	public String getPackagecode() {
		return packagecode;
	}
	public void setPackagecode(String packagecode) {
		this.packagecode = packagecode;
	}
	public String getPackagename() {
		return packagename;
	}
	public void setPackagename(String packagename) {
		this.packagename = packagename;
	}
	public String getAltpname() {
		return altpname;
	}
	public void setAltpname(String altpname) {
		this.altpname = altpname;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public int getNooftest() {
		return nooftest;
	}
	public void setNooftest(int nooftest) {
		this.nooftest = nooftest;
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
	public void setLastmoddate(String lastmoddate) {
		this.lastmoddate = lastmoddate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "PackagesMasters [packageid=" + packageid + ", packagename=" + packagename + ", altpname=" + altpname
				+ ", category=" + category +  ", actprice=" + actprice + ", discount="
				+ discount + ", price=" + price + ", nooftest=" + nooftest + ", male=" + male + ", female=" + female
				+ ", age=" + age + ", prerequisite=" + prerequisite + ", dscr=" + dscr + ", lastmodby=" + lastmodby
				+ ", lastmoddate=" + lastmoddate + "]";
	}
	
	
}

