/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.Blob;
import java.time.Period;

/**
 *
 * @author rilah
 */
public class GS {
    
    private int did, aid, slot, number, uid, testid, ano, paID, aslot, Testano, Sid, Status;
    private String name, speciality, date, time, day, testname, testdate, testtime, fname, lname, email, mobilenumber, drname, drspeciality, dob, delay, uname, Cstatus, gender, blood, piccode, piccode1, earnings,nic;
    private int[] slotlist;
    private String[] timelist, datelist, daylist;
    private Blob blob;
    private byte[] password, Salt;
    private java.time.Period age;

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getEarnings() {
        return earnings;
    }

    public void setEarnings(String earnings) {
        this.earnings = earnings;
    }

    public Period getAge() {
        return age;
    }

    public void setAge(Period age) {
        this.age = age;
    }

       
    public String getPiccode1() {
        return piccode1;
    }

    public void setPiccode1(String piccode1) {
        this.piccode1 = piccode1;
    }

    public String getPiccode() {
        return piccode;
    }

    public void setPiccode(String piccode) {
        this.piccode = piccode;
    }

    public String getBlood() {
        return blood;
    }

    public void setBlood(String blood) {
        this.blood = blood;
    }
    
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    public String getCstatus() {
        return Cstatus;
    }

    public void setCstatus(String Cstatus) {
        this.Cstatus = Cstatus;
    }

    public int getSid() {
        return Sid;
    }

    public void setSid(int Sid) {
        this.Sid = Sid;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getTestid() {
        return testid;
    }

    public void setTestid(int testid) {
        this.testid = testid;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public int getPaID() {
        return paID;
    }

    public void setPaID(int paID) {
        this.paID = paID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getTestname() {
        return testname;
    }

    public void setTestname(String testname) {
        this.testname = testname;
    }

    public String getTestdate() {
        return testdate;
    }

    public void setTestdate(String testdate) {
        this.testdate = testdate;
    }

    public String getTesttime() {
        return testtime;
    }

    public void setTesttime(String testtime) {
        this.testtime = testtime;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobilenumber() {
        return mobilenumber;
    }

    public void setMobilenumber(String mobilenumber) {
        this.mobilenumber = mobilenumber;
    }

    public String getDrname() {
        return drname;
    }

    public void setDrname(String drname) {
        this.drname = drname;
    }

    public String getDrspeciality() {
        return drspeciality;
    }

    public void setDrspeciality(String drspeciality) {
        this.drspeciality = drspeciality;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    

    public int[] getSlotlist() {
        return slotlist;
    }

    public void setSlotlist(int[] slotlist) {
        this.slotlist = slotlist;
    }

    public String[] getTimelist() {
        return timelist;
    }

    public void setTimelist(String[] timelist) {
        this.timelist = timelist;
    }

    public String[] getDatelist() {
        return datelist;
    }

    public void setDatelist(String[] datelist) {
        this.datelist = datelist;
    }

    public String[] getDaylist() {
        return daylist;
    }

    public void setDaylist(String[] daylist) {
        this.daylist = daylist;
    }

    public Blob getBlob() {
        return blob;
    }

    public void setBlob(Blob blob) {
        this.blob = blob;
    }

    public byte[] getPassword() {
        return password;
    }

    public void setPassword(byte[] password) {
        this.password = password;
    }

    public byte[] getSalt() {
        return Salt;
    }

    public void setSalt(byte[] Salt) {
        this.Salt = Salt;
    }

    public int getAslot() {
        return aslot;
    }

    public void setAslot(int aslot) {
        this.aslot = aslot;
    }

    public String getDelay() {
        return delay;
    }

    public void setDelay(String delay) {
        this.delay = delay;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public int getTestano() {
        return Testano;
    }

    public void setTestano(int Testano) {
        this.Testano = Testano;
    }

    
    
}
