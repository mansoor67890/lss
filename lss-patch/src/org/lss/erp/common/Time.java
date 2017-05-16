/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package org.lss.erp.common;

/**
 * @author Zubair
 */
public class Time {

    private int hh;
    private int mm;
    private int ss;

    public Time() {
        hh = 0;
        mm = 0;
        ss = 0;
    }

    public int getHh() {
        return hh;
    }

    public void setHh(int hh) {
        this.hh = hh;
    }

    public int getMm() {
        return mm;
    }

    public void setMm(int mm) {
        this.mm = mm;
    }

    public int getSs() {
        return ss;
    }

    public void setSs(int ss) {
        this.ss = ss;
    }
}
